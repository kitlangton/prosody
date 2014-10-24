class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).published
  end


  def desk
    @posts = Post.where(user_id:current_user.id).published.order("published_on desc").page params[:page]
    @drafts = Post.where(user_id:current_user.id).unpublished.order("updated_at desc").page params[:page]
  end

  def publish
    @post = Post.find(params[:format])
    @post.publish!
    redirect_to desk_path
  end

  def unpublish
    @post = Post.find(params[:format])
    @post.update(published_on: nil)
    redirect_to desk_path
  end

  def new_de_plume
    if request.xhr?
      render html: current_user.generate_nom_de_plume.titleize
    end
  end
end
