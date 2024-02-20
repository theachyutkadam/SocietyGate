# frozen_string_literal: true

# == Schema Information
#
# Table name: flats
#
#  id                       :bigint           not null, primary key
#  area_in_feet             :integer
#  electricity_meter_number :string           not null
#  gas_meter_number         :string           not null
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
#  index_flats_on_electricity_meter_number  (electricity_meter_number) UNIQUE
#  index_flats_on_floor_id                  (floor_id)
#  index_flats_on_gas_meter_number          (gas_meter_number) UNIQUE
#  index_flats_on_owner_id                  (owner_id)
#  index_flats_on_tenant_id                 (tenant_id)
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

  has_many :complaints, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :gate_entries, dependent: :destroy
  has_many :tenant_histories, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :parkings, dependent: :destroy
  has_many :family_members, dependent: :destroy

  delegate :wing, to: :floor

  enum structure: { one: 0, two: 1, three: 2 }

  validates :electricity_meter_number, :gas_meter_number, :letter_box_number, :number, :structure, presence: true
  validates :area_in_feet, numericality: true
  validates :is_rented, inclusion: [true, false]

  validate :tenant_available?

  before_validation :set_letter_box_number

  def tenant_available?
    errors.add(:tenant, "is required") if is_rented && !tenant
  end

  def set_letter_box_number
    self.number = wing.flats.last.number + 1
    self.letter_box_number = "#{wing.building.name}/#{wing.name}-#{number}"
    set_flat_details unless valid?
  end

  def set_flat_details
    unique_number = Faker::Base.numerify("##########")
    if Flat.where("gas_meter_number = ?  OR electricity_meter_number = ?", unique_number, unique_number).any
      set_flat_details
    else
      self.gas_meter_number = unique_number
      self.electricity_meter_number = unique_number
    end
  end
end
