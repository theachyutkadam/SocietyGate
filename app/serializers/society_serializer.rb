class SocietySerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :location, :status, :registration_number, :contact, :email, :address
end
