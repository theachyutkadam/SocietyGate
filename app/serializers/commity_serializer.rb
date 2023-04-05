class CommitySerializer < ActiveModel::Serializer
  attributes :id, :title, :members_limit
  has_one :sector
end
