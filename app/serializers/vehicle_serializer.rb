# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id           :bigint           not null, primary key
#  color        :string
#  company      :string
#  name         :string
#  number       :string
#  status       :integer
#  vehicle_type :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flat_id      :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_vehicles_on_flat_id  (flat_id)
#  index_vehicles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
include Rails.application.routes.url_helpers

class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :link, :number, :name, :vehicle_type, :color, :company, :status, :flat, :user
  # has_one :flat
  # has_one :user
  def link
    api_vehicle_url(object)
  end

  def flat
    return unless object.flat

    ActiveModelSerializers::SerializableResource.new(
      object.flat, each_serializer: UserInformationSerializer
    )
  end

  def user
    return unless object.user

    ActiveModelSerializers::SerializableResource.new(
      object.user, each_serializer: UserInformationSerializer
    )
  end
end
