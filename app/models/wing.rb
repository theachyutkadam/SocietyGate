# frozen_string_literal: true

# == Schema Information
#
# Table name: wings
#
#  id              :bigint           not null, primary key
#  name            :string
#  number_of_lifts :integer
#  structure       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  building_id     :bigint           not null
#
# Indexes
#
#  index_wings_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
class Wing < ApplicationRecord
  belongs_to :building
  enum structure: { east_west: 0, south_north: 1, other: 2 }, _default: "other"
end
