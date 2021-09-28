class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :firstname_kannji, :lastname_kannji, :firstname_katakana, :lastname_katakana,
                                             :birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'yasuda' && password == '1881'
    end
  end
end
