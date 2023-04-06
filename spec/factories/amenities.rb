# frozen_string_literal: true

# == Schema Information
#
# Table name: amenities
#
#  id                   :bigint           not null, primary key
#  end_time             :datetime
#  fee                  :float
#  is_paid              :boolean
#  name                 :string
#  only_for             :integer
#  start_time           :datetime
#  terms_and_conditions :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  building_id          :bigint           not null
#
# Indexes
#
#  index_amenities_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
FactoryBot.define do
  factory :amenity do
    name { %w[SwimmingPool Garden Clubhouse Tennies].shuffle.sample }
    start_time { Date.today }
    end_time { Faker::Date.forward(days: 23) }
    is_paid { false }
    only_for { Amenity.only_fors.keys.sample }
    fee { 0.0 }
    terms_and_conditions { Faker::Lorem.question(word_count: 4) }
  end
end
