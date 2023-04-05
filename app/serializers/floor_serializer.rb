class FloorSerializer < ActiveModel::Serializer
  attributes :id, :number, :number_of_flats, :is_refuge_area, :fire_exebution, :service_at
  has_one :wing
end
