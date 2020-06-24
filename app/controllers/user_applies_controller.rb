class UserAppliesController < ApplicationController
  before_action :logged_in_user, only: :create   

  def create
    status = current_user.user_applies.create apply_params
    respond_to :js
  end

  def destroy; end

  private 

  def apply_params
    params.permit UserApply::USER_APPLY_PERMIT
  end
end
