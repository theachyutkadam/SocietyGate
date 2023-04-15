# frozen_string_literal: true

# == Schema Information
#
# Table name: amenities
#
#  id                   :bigint           not null, primary key
#  close_time             :datetime
#  fee                  :float
#  is_paid              :boolean
#  name                 :string
#  only_for             :integer
#  open_time           :datetime
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
class Amenity < ApplicationRecord
  belongs_to :building
  enum only_for: { male: 0, female: 1, kids: 2, senior: 3 }

  validates :name, :open_time, :close_time, presence: true
  validates_comparison_of :close_time, greater_than: :open_time

  validate :amenity_uniqueness

  def amenity_uniqueness
    return unless Amenity.where(name: name, building_id: building_id).any?

    errors.add(:name, "already exists")
  end
end
