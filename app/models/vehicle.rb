# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id           :bigint           not null, primary key
#  color        :string
#  company      :string
#  name         :string
#  number       :string
#  status       :integer
#  vehicle_type :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flat_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_vehicles_on_flat_id  (flat_id)
#  index_vehicles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
class Vehicle < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  delegate :society, to: :user

  enum status: { active: 0, blocked: 1, deleted: 2, pending: 3 }, _default: "active"
  enum vehicle_type: { bike: 0, car: 1, other: 2 }

  validates :color, :company, :name, :number, :vehicle_type, presence: true
end
