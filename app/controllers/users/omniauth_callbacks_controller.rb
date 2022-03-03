# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :github

  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Github')
    else
      redirect_to new_user_session_url('user[email]': request.env['omniauth.auth']['info']['email'])
    end
  end

  def failure
    redirect_to root_path
  end
end
