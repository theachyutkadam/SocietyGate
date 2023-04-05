class FlatSerializer < ActiveModel::Serializer
  attributes :id, :number, :area_in_feet, :is_rented, :structure, :letter_box_number, :electricity_meter_number, :gas_meter_number
  has_one :owner
  has_one :floor
  has_one :tenant
end
