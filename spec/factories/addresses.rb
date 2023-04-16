# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  city        :string
#  flat_number :integer
#  pin_code    :string
#  state       :string
#  street_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :address do
    flat_number { Faker::Address.zip }
    building { Faker::Address.building_number }
    street_name { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    pin_code { Faker::Number.number(digits: 6) }
  end
end
