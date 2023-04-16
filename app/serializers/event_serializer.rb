# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  end_at      :datetime
#  is_private  :boolean
#  name        :string
#  start_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  building_id :bigint           not null
#  flat_id     :bigint           not null
#
# Indexes
#
#  index_events_on_building_id  (building_id)
#  index_events_on_flat_id      (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#
    api_address_url(object)
  end
end_at      :datetime
#  is_private  :boolean
#  name        :string
#  start_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  building_id :bigint           not null
#  flat_id     :bigint           not null
#
# Indexes
#
#  index_events_on_building_id  (building_id)
#  index_events_on_flat_id      (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#
include Rails.application.routes.url_helpers

class EventSerializer < ActiveModel::Serializer
  attributes :id, :link, :name, :start_at, :end_at, :is_private
  has_one :building
  has_one :flat
  def link
    api_event_url(object)
  end
end
