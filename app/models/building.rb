# frozen_string_literal: true

# == Schema Information
#
# Table name: buildings
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  society_id :bigint           not null
#
# Indexes
#
#  index_buildings_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
class Building < ApplicationRecord
  belongs_to :society
  has_many :wings, dependent: :destroy
  has_many :amenities, dependent: :destroy
  has_many :complaints, dependent: :destroy
  has_many :commities, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :parkings, dependent: :destroy

  enum status: { active: 0, blocked: 1, closed: 2 }, _default: "active"

  validates :name, :status, presence: true
end
