class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :number, :name, :type, :color
  has_one :flat
  has_one :user
end
