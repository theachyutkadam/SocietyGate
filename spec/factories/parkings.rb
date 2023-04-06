# frozen_string_literal: true

# == Schema Information
#
# Table name: parkings
#
#  id           :bigint           not null, primary key
#  is_covered   :boolean
#  number       :string
#  size_in_feet :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  building_id  :bigint           not null
#  flat_id      :bigint           not null
#  owner_id     :bigint           not null
#
# Indexes
#
#  index_parkings_on_building_id  (building_id)
#  index_parkings_on_flat_id      (flat_id)
#  index_parkings_on_owner_id     (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (owner_id => users.id)
#
FactoryBot.define do
  factory :parking do
    number { Faker::Base.bothify("??####") }
    is_covered { false }
    size_in_feet { Faker::Base.bothify("###") }
  end
end
