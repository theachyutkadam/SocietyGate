# frozen_string_literal: true

# == Schema Information
#
# Table name: commities
#
#  id            :bigint           not null, primary key
#  members_limit :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  building_id   :bigint           not null
#
# Indexes
#
#  index_commities_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
class Commity < ApplicationRecord
  belongs_to :building

  validates :title, :members_limit, presence: true
  validates :members_limit, numericality: true
end
