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
class AmenitySerializer < ActiveModel::Serializer
  attributes :id, :name, :open_time, :close_time, :is_paid, :only_for, :fee, :terms_and_conditions
  has_one :building
end
