# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!, except: [:health]

  def current_user
    @login_user
  end

  def current_user_information
    @login_user.user_information
  end

  def health
    records = ApplicationRecord.record_count
    active_users = User.active.first(10).pluck(:email)
    # render json: {count: records, routes: `Rails.application.routes.routes`}
    # routes = `rails routes --expand | grep api/`
    render json: { count: records, active_users: }
  end

  def pagination(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page, # use object.previous_page when using will_paginate
      total_pages: object.total_pages,
      total_count: object.total_count,
    }
  end

  private

  def authenticate_user!
    p "+++++++++++++++++"
    p request.headers["authorization"]
    p "+++++++++++++++++"
    if request.headers["authorization"]
      return render json: { errors: "Invalid token" }, status: :unauthorized unless find_user

      @login_user
    else
      render json: { message: "No authorization Header sent" }, status: :forbidden
    end
  end

  def find_user
    @login_user = User.find_by(token: request.headers["authorization"])
  end
end
