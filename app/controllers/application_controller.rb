# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    profile = %i[postal_code address bio]
    devise_parameter_sanitizer.permit(:sign_up, keys: profile)
    devise_parameter_sanitizer.permit(:account_update, keys: profile)
  end
end
