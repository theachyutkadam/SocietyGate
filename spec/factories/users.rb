# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  is_admin        :boolean
#  is_primary_user :boolean
#  password        :string
#  status          :integer
#  token           :string
#  type            :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  society_id      :bigint           not null
#
# Indexes
#
#  index_users_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
FactoryBot.define do
  factory :user do
    username { 'MyString' }
    password { 'MyString' }
    email { 'MyString' }
    status { 1 }
    is_admin { false }
    token { 'MyString' }
    society { nil }
    type { 1 }
    is_primary_user { false }
  end
end
