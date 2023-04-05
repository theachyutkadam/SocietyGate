class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_at, :end_at, :is_private
  has_one :sector
  has_one :flat
end
