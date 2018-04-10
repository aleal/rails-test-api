class AuthenticationController < ApplicationController 
  skip_before_action :authenticate_request, except: [:authenticate_by_token]
  def authenticate
    command = AuthenticateUser.call(authentication_params)
    if command.success?
        render json: command.result
    else
        render json: { error: command.errors }, status: :unauthorized
    end
  end

  def authenticate_by_token
      render json: { token: @current_token, user: @current_user }
  end

  private

  def authentication_params
     params.require(:credentials).permit(:email, :password)
  end
end
