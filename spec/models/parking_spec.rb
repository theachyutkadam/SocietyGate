# frozen_string_literal: true

# == Schema Information
#
# Table name: parkings
#
#  id           :bigint           not null, primary key
#  is_covered   :boolean
#  number       :string
#  size_in_feet :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flat_id      :bigint           not null
#  owner_id     :bigint           not null
#  sector_id    :bigint           not null
#
# Indexes
#
#  index_parkings_on_flat_id    (flat_id)
#  index_parkings_on_owner_id   (owner_id)
#  index_parkings_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (sector_id => sectors.id)
#
require "rails_helper"

RSpec.describe Parking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
