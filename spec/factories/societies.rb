# frozen_string_literal: true

# == Schema Information
#
# Table name: societies
#
#  id                  :bigint           not null, primary key
#  address             :text
#  city                :string
#  contact             :string
#  email               :string
#  location            :string
#  name                :string
#  registration_number :string
#  state               :string
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :society do
    name { Faker::Superhero.power }
    city { Faker::Address.city }
    state { Faker::Address.state }
    location { Faker::Address.street_name }
    status { Society.statuses.keys.sample }
    registration_number { Faker::Base.bothify("?????####?") }
    contact { Faker::Base.numerify("##########") }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
