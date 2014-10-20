class PromptsController < ApplicationController
  def new
    @prompt = Prompt.new
  end

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      flash[:success] = "Prompt created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def prompt_params
    params.require(:prompt).permit(:name,:description,:action)
  end

end
