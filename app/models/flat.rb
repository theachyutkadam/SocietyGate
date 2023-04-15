# frozen_string_literal: true

# == Schema Information
#
# Table name: flats
#
#  id                       :bigint           not null, primary key
#  area_in_feet             :integer
#  electricity_meter_number :string
#  gas_meter_number         :string
#  is_rented                :boolean
#  letter_box_number        :string
#  number                   :string
#  structure                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  floor_id                 :bigint           not null
#  owner_id                 :bigint           not null
#  tenant_id                :bigint
#
# Indexes
#
#  index_flats_on_floor_id   (floor_id)
#  index_flats_on_owner_id   (owner_id)
#  index_flats_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (tenant_id => users.id)
#
class Flat < ApplicationRecord
  belongs_to :floor
  belongs_to :owner, class_name: "User"
  belongs_to :tenant, class_name: "User", optional: true
  delegate :wing, to: :floor

  enum structure: { one: 0, two: 1, three: 2 }

  validates :electricity_meter_number, :gas_meter_number, :letter_box_number, :number, :structure, presence: true
  validates :area_in_feet, numericality: true
  validates :is_rented, inclusion: [true, false]

  validate :tenant_available?

  before_create :set_letter_box_number

  def tenant_available?
    errors.add(:tenant, "is required") if is_rented && !tenant
  end

  def set_letter_box_number
    self.letter_box_number = "#{wing.building.name}-#{wing.name}-#{number}"
  end
end
