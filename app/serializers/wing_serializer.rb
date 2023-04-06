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
class WingSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_lifts, :structure
  has_one :building
end
