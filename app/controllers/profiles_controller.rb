class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  before_action :correct_user, only: %i(destroy edit update)
  before_action :check_valid_profile_applied, only: :destroy

  authorize_resource

  def new
    @profile = current_user.profiles.build.tap do |p|
      p.qualifications.build
      p.experiences.build
      p.profile_skills.build
    end
  end

  def show
    @profile = Profile.find_by id: params[:id]
    return if @profile

    flash[:danger] = t "admin.profile.user_not_found"
    redirect_to root_url
  end

  def edit; end

  def create
    @profile = current_user.profiles.build profile_params
    @profile.image.attach profile_params[:avatar]
    if @profile.save
      flash[:success] = t "notification.create_success"
      redirect_to root_url
    else
      flash.now[:danger] = t "notification.create_fail"
      render :new
    end
  end

  def update
    @profile.image.attach profile_params[:avatar] if profile_params[:avatar].present?
    if @profile.update profile_params
      flash[:success] = t "notification.update_success"
      redirect_to user_path
    else
      flash.now[:danger] = t "notification.update_fail"
      render :edit
    end
  end

  def destroy
    if @profile.destroy
      flash[:success] = t "notification.profile_delete"
      redirect_to request.referrer || root_url
    else 
      flash[:danger] = t "notification.delete_fail"
      redirect_to root_url
    end 
  end

  private
  
  def profile_params
    params.require(:profile).permit Profile::PROFILE_PERMIT
  end

  def correct_user
    @profile = current_user.profiles.find_by id: params[:id]
    redirect_to root_url unless @profile
  end

  def check_valid_profile_applied
    @profile_applied = current_user.user_applies.find_by profile_id: params[:id]

    if @profile_applied.nil?
      flash[:danger] = t "admin.profile.user_not_found"
      redirect_to root_url
    else
      return if @profile_applied.pending? 
      
      flash[:danger] = t "cv.cv_approved"
      redirect_to user_path
    end
  end
end
