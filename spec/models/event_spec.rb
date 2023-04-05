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
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
