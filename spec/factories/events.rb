# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  end_at      :datetime
#  is_private  :boolean
#  name        :string
#  start_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  building_id :bigint           not null
#  flat_id     :bigint           not null
#
# Indexes
#
#  index_events_on_building_id  (building_id)
#  index_events_on_flat_id      (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#
FactoryBot.define do
  factory :event do
    name { Faker::Quote.singular_siegler }
    start_at { Faker::Date.forward(days: 1)  }
    end_at {  Faker::Date.forward(days: 2) }
    is_private { false }
  end
end
