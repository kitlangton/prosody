class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end


  def desk
    @posts = Post.where(user_id:current_user.id).published.order("created_at desc").page params[:page]
    @drafts = Post.where(user_id:current_user.id).unpublished.order("created_at desc").page params[:page]
  end

  def publish
    @post = Post.find(params[:format])
    @post.update(published_on: DateTime.now)
    redirect_to desk_path
  end

  def unpublish
    @post = Post.find(params[:format])
    @post.update(published_on: nil)
    redirect_to desk_path
  end
end
