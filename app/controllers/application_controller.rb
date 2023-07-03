class ApplicationController < ActionController::Base
  # Add this line to see the progress bar long enough
  # and remove it when it has the expected styles
  # before_action -> { sleep 3 }
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:company_id, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:company_id, :email, :password, :password_confirmation, :current_password)
    end
  end

  private
  
  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
end
