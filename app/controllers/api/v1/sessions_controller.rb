class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if good_credentials(user)
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: {error: 'Bad credentials'}, status: 401
    end
  end

  private
  def good_credentials(user)
    user && user.authenticate(params[:password])
  end
end
