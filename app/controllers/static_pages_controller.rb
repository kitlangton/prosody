class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @haikus = Haiku.all.order("created_at desc")
    # @prompts = Prompt.all
    @posts = Kaminari.paginate_array(Prompt.all + Post.published.order("created_at desc")).page params[:page]
  end

end
