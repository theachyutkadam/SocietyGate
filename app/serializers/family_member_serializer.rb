class FamilyMemberSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :contact, :birth_date, :gender, :pan_card_number, :adhaar_card_number, :avatar_url, :maritial_status, :status, :relation_with
  has_one :flat
end
