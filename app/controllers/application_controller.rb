require_relative "../services/strava_auth"

class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end


  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def set_locale
     if request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first == 'it'
      return I18n.locale = :it
    elsif request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first == 'fr'
      return I18n.locale = :fr
    else
      return I18n.locale = :en
    end
      return I18n.locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

private


  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:group, :gender, :first_name, :last_name, :avatar, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:group, :gender, :first_name, :last_name, :avatar, :birthday])
  end


  def after_sign_in_path_for(resource_or_scope)
    if  URI.parse(request.referer).path == "/users" ||  URI.parse(request.referer).path == "/users/sign_in" || URI.parse(request.referer).path == "/users/password/edit"
      root_path
    else
      URI.parse(request.referer).path if request.referer
    end
  end


end
