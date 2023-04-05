class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :flat_number, :road, :taluka, :district, :state, :pin_code
  has_one :user
end
