class StaticPagesController < ApplicationController
  def index
    @haikus = Haiku.all.order("created_at desc")
    @posts = Post.published.order("created_at desc")
  end
end
