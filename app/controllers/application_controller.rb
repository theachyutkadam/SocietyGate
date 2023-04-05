# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def current_user
    @login_user
  end

  def current_user_information
    @login_user.user_information
  end

  private

  def authenticate_user!
    if request.authorization
      return render json: { errors: "Invalid token" }, status: :unauthorized unless find_user

      @login_user
    else
      render json: { message: "No authorization Header sent" }, status: :forbidden
    end
  end

  def find_user
    @login_user = User.find_by(token: request.authorization)
  end
end
