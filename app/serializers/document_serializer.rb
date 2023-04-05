class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :images, :description
  has_one :user
end
