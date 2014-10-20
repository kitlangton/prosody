class HaikusController < ApplicationController
  before_action :require_signin!

  def new
    @post = Post.new
  end

  private

end
