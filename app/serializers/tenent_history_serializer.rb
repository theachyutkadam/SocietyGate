class TenentHistorySerializer < ActiveModel::Serializer
  attributes :id, :move_in_at, :move_out_at
  has_one :tenant
  has_one :flat
end
