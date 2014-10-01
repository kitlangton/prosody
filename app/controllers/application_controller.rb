class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_signin!
    if current_user.nil?
      redirect_to new_user_session_path
      flash[:error] = "Must sign in to create a post"
    end
  end

end
