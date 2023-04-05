class SectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :status
  has_one :society
end
