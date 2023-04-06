# frozen_string_literal: true

# == Schema Information
#
# Table name: complaints
#
#  id             :bigint           not null, primary key
#  complaint_type :integer
#  description    :text
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  building_id    :bigint           not null
#  flat_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_complaints_on_building_id  (building_id)
#  index_complaints_on_flat_id      (flat_id)
#  index_complaints_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Complaint, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
