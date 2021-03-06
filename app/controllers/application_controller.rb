class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation,:current_password,:email,:first_name, :last_name, :phone, :bio, :avatar, address_attributes: [:street, :city, :state, :zip]) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:password, :password_confirmation,:current_password,:email,:first_name, :last_name, :phone, :bio, :avatar, address_attributes: [:street, :city, :state, :zip]) }
  end
end
