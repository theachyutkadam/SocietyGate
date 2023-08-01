# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  is_admin        :boolean
#  is_primary_user :boolean
#  password        :string
#  status          :integer
#  token           :string           not null
#  user_type       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  society_id      :bigint           not null
#
# Indexes
#
#  index_users_on_email       (email) UNIQUE
#  index_users_on_society_id  (society_id)
#  index_users_on_token       (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
include Rails.application.routes.url_helpers

class UserSerializer < ActiveModel::Serializer
  attributes :id, :link, :email, :status, :is_admin, :user_type, :is_primary_user, :full_name
  has_one :society

  def link
    api_user_url(object)
  end

  def full_name
    object.user_information.full_name
  end
end
