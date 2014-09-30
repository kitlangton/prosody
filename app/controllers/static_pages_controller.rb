class StaticPagesController < ApplicationController
  def index
    @haikus = Haiku.all
  end
end
