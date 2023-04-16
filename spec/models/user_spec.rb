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
require "rails_helper"

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
