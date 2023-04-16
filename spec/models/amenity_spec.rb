# frozen_string_literal: true

# == Schema Information
#
# Table name: amenities
#
#  id                   :bigint           not null, primary key
#  close_time           :time
#  fee                  :float
#  is_paid              :boolean
#  name                 :string
#  only_for             :integer
#  open_time            :time
#  terms_and_conditions :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  building_id          :bigint           not null
#
# Indexes
#
#  index_amenities_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
require "rails_helper"

RSpec.describe Amenity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
