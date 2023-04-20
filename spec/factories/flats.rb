# frozen_string_literal: true

# == Schema Information
#
# Table name: flats
#
#  id                       :bigint           not null, primary key
#  area_in_feet             :integer
#  electricity_meter_number :string           not null
#  gas_meter_number         :string           not null
#  is_rented                :boolean
#  letter_box_number        :string
#  number                   :string
#  structure                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  floor_id                 :bigint           not null
#  owner_id                 :bigint           not null
#  tenant_id                :bigint
#
# Indexes
#
#  index_flats_on_electricity_meter_number  (electricity_meter_number) UNIQUE
#  index_flats_on_floor_id                  (floor_id)
#  index_flats_on_gas_meter_number          (gas_meter_number) UNIQUE
#  index_flats_on_owner_id                  (owner_id)
#  index_flats_on_tenant_id                 (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (tenant_id => users.id)
#
FactoryBot.define do
  factory :flat do
    number { Faker::Base.numerify("####") }
    area_in_feet { 550 }
    is_rented { Faker::Boolean.boolean }
    structure { Flat.structures.keys.sample }
    letter_box_number { Faker::Base.numerify("######") }
    electricity_meter_number { Faker::Base.numerify("##########") }
    gas_meter_number { Faker::Base.numerify("##########") }
  end
end
