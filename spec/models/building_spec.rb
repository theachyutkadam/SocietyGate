# frozen_string_literal: true

# == Schema Information
#
# Table name: buildings
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  society_id :bigint           not null
#
# Indexes
#
#  index_buildings_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
require "rails_helper"

RSpec.describe Building, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
