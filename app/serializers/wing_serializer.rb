class WingSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_lifts, :structure
  has_one :sector
end
