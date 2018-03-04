require_relative "../services/strava_auth"
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:group, :gender, :first_name, :last_name, :avatar, :birthday])
    devise_parameter_sanitizer.permit(:edit, keys: [:group, :gender, :first_name, :last_name, :avatar, :birthday])
  end


end
