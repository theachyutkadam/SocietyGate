class AmenitySerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :end_time, :is_paid, :only_for, :fee, :terms_and_conditions
  has_one :sector
end
