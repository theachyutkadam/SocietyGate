# frozen_string_literal: true

# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  color      :string
#  name       :string
#  number     :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flat_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_vehicles_on_flat_id  (flat_id)
#  index_vehicles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :vehicle do
    number { "MyString" }
    name { "MyString" }
    type { 1 }
    color { "MyString" }
    flat { nil }
    user { nil }
  end
end
