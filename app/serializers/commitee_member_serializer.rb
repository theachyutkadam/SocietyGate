class CommiteeMemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :members_count, :designation
  has_one :user
  has_one :commity
end
