class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render 'show'
  end

  def create
    @post = Post.new(post_params)
    @post.update(user: current_user)
    if @post.save
      if params[:button] == "publish"
        @post.publish!
      end
      redirect_to desk_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title,:body)
  end

end
