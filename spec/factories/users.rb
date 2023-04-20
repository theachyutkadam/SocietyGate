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
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456" }
    token { Faker::Internet.device_token }
    is_admin { false }
    status { User.statuses.keys.sample }
    user_type { User.user_types.keys.sample }
    is_primary_user { true }
  end
end
