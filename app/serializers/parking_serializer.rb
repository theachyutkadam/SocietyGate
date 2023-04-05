class ParkingSerializer < ActiveModel::Serializer
  attributes :id, :number, :is_covered, :size_in_feet
  has_one :sector
  has_one :owner
  has_one :flat
end
