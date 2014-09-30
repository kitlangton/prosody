class HaikusController < ApplicationController

  def new
    @haiku = Haiku.new
  end

  def create
    @haiku = Haiku.new(haiku_params)

    if @haiku.save
      redirect_to root_path
      flash[:success] = "New Haiku Created!"
    else
      render "new"
    end
  end

  private

  def haiku_params
    params.require(:haiku).permit(:text)
  end
end
