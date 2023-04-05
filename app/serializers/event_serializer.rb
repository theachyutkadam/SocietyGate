# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  end_at     :datetime
#  is_private :string
#  name       :string
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flat_id    :bigint           not null
#  sector_id  :bigint           not null
#
# Indexes
#
#  index_events_on_flat_id    (flat_id)
#  index_events_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (sector_id => sectors.id)
#
class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_at, :end_at, :is_private
  has_one :sector
  has_one :flat
end
