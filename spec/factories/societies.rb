# frozen_string_literal: true

# == Schema Information
#
# Table name: societies
#
#  id                  :bigint           not null, primary key
#  address             :text
#  city                :string
#  contact             :string           not null
#  email               :string           not null
#  location            :string
#  name                :string           not null
#  registration_number :string           not null
#  state               :string
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_societies_on_contact              (contact) UNIQUE
#  index_societies_on_email                (email) UNIQUE
#  index_societies_on_name                 (name) UNIQUE
#  index_societies_on_registration_number  (registration_number) UNIQUE
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
