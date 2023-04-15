# frozen_string_literal: true

# == Schema Information
#
# Table name: gate_entries
#
#  id                 :bigint           not null, primary key
#  contact            :string
#  entry_type         :integer
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  person_image_url   :string
#  status             :integer
#  vehicale_image_url :string
#  vehicle_number     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  flat_id            :bigint           not null
#
# Indexes
#
#  index_gate_entries_on_flat_id  (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
include Rails.application.routes.url_helpers

class GateEntrySerializer < ActiveModel::Serializer
  attributes :id, :link, :entry_type, :status, :vehicle_number, :first_name, :last_name, :gender, :contact, :vehicale_image_url,
             :person_image_url
  has_one :flat
  def link
    api_gate_entry_url(object)
  end
end
