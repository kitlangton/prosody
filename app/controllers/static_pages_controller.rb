class StaticPagesController < ApplicationController
  def index
    @haikus = Haiku.all.order("created_at desc")
    @posts = Post.all.order("created_at desc")
  end
end
