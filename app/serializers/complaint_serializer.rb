class ComplaintSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :description
  has_one :user
  has_one :sector
  has_one :flat
end
