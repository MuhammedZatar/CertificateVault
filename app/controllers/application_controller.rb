class ApplicationController < ActionController::Base
  include Pundit  # Include the Pundit module in the ApplicationController class
  helper Devise::Controllers::Helpers # Include the Devise::Controllers::Helpers module in the ApplicationController class


  protect_from_forgery with: :exception # Protect from CSRF attacks
  # Authenticate the user before any action, unless the controller is Pages and the action is home
  before_action :authenticate_user!, unless: -> { controller_name == "pages" && action_name == "home" }
  before_action :check_admin_status

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized # Handle Pundit::NotAuthorizedError exceptions

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action." 
    redirect_to(request.referrer || root_path)  # Redirect the user to the previous page or the root path
  end

  def check_admin_status
    if current_user && request.fullpath.start_with?('/admin') && !current_user.is_admin
      flash[:alert] = "You are not authorized to access this page."
      redirect_to main_app.authenticated_root_path
    end
  end
end
