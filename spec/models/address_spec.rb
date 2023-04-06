# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  city        :string
#  flat_number :integer
#  pin_code    :string
#  state       :string
#  street_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
