class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = params[:post_id]
    redirect_to post_path(@post)
  end

  def create
    @comment = Comment.new(post_params)
    @comment.user = current_user
    @comment.save
    redirect_to @comment.post
  end

  private

  def post_params
    params.require(:comment).permit(:body,:post_id,:quote)
  end
end
