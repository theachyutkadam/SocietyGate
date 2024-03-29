# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id           :bigint           not null, primary key
#  color        :string
#  company      :string
#  name         :string
#  number       :string
#  status       :integer
#  vehicle_type :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flat_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_vehicles_on_flat_id  (flat_id)
#  index_vehicles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :vehicle do
    number { Faker::Base.bothify("??##??####") }
    company { Faker::Vehicle.make }
    name { Faker::Vehicle.model }
    status { Vehicle.statuses.keys.sample }
    vehicle_type { Vehicle.vehicle_types.keys.sample }
    color { Faker::Vehicle.color }
  end
end
