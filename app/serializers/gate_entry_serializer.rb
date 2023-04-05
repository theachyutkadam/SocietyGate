class GateEntrySerializer < ActiveModel::Serializer
  attributes :id, :type, :status, :vehicle_number, :first_name, :last_name, :gender, :contact, :vehicale_image_url, :person_image_url
  has_one :flat
end
