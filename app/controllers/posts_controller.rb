class PostsController < ApplicationController
  before_action :load_post, only: :show 
 
  def show; end

  private

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
  
    flash[:danger] = t "admin.post.not_found"
    redirect_to root_path
  end
end
