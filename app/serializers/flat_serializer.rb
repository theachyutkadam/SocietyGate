# frozen_string_literal: true

# == Schema Information
#
# Table name: flats
#
#  id                       :bigint           not null, primary key
#  area_in_feet             :integer
#  electricity_meter_number :string           not null
#  gas_meter_number         :string           not null
#  is_rented                :boolean
#  letter_box_number        :string
#  number                   :string
#  structure                :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  floor_id                 :bigint           not null
#  owner_id                 :bigint           not null
#  tenant_id                :bigint
#
# Indexes
#
#  index_flats_on_electricity_meter_number  (electricity_meter_number) UNIQUE
#  index_flats_on_floor_id                  (floor_id)
#  index_flats_on_gas_meter_number          (gas_meter_number) UNIQUE
#  index_flats_on_owner_id                  (owner_id)
#  index_flats_on_tenant_id                 (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (floor_id => floors.id)
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (tenant_id => users.id)
#
include Rails.application.routes.url_helpers

class FlatSerializer < ActiveModel::Serializer
  attributes :id, :link, :number, :area_in_feet, :is_rented, :structure, :letter_box_number, :electricity_meter_number,
             :gas_meter_number, :owner, :tenant, :floor
  # has_one :owner, serializer: UserSerializer
  # has_one :tenant, serializer: UserSerializer
  # has_one :floor
  delegate :floor, to: :object

  def link
    api_flat_url(object)
  end

  def owner
    return unless object.owner.user_information

    ActiveModelSerializers::SerializableResource.new(
      object.owner.user_information, each_serializer: UserInformationSerializer
    )
  end

  def tenant
    return unless object.tenant

    ActiveModelSerializers::SerializableResource.new(
      object.tenant.user_information, each_serializer: UserInformationSerializer
    )
  end
end
