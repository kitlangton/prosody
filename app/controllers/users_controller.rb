class UsersController < ApplicationController
  def desk
    @posts = Post.where(user_id:current_user.id)
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
