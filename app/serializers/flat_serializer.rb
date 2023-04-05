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
#  number                   :integer
#  structure                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  floor_id                 :bigint           not null
#  owner_id                 :bigint           not null
#  tenant_id                :bigint           not null
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
class FlatSerializer < ActiveModel::Serializer
  attributes :id, :number, :area_in_feet, :is_rented, :structure, :letter_box_number, :electricity_meter_number, :gas_meter_number
  has_one :owner
  has_one :floor
  has_one :tenant
end
