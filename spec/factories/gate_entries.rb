# frozen_string_literal: true

# == Schema Information
#
# Table name: gate_entries
#
#  id                 :bigint           not null, primary key
#  contact            :string
#  entry_type         :integer
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  person_image_url   :string
#  status             :integer
#  vehicale_image_url :string
#  vehicle_number     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  flat_id            :bigint           not null
#
# Indexes
#
#  index_gate_entries_on_flat_id  (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
FactoryBot.define do
  factory :gate_entry do
    entry_type { GateEntry.entry_types.keys.sample }
    status { GateEntry.statuses.keys.sample }
    gender { 1 }
    # gender { GateEntry.genders.keys.sample }
    vehicle_number {Faker::Base.bothify("??##??####") }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact {Faker::Base.bothify("##########") }
    vehicale_image_url { "vehicale_image_url" }
    person_image_url { "person_image_url" }
  end
end
