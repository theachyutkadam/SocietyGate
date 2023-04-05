# frozen_string_literal: true

# == Schema Information
#
# Table name: floors
#
#  id              :bigint           not null, primary key
#  fire_exebution  :boolean
#  is_refuge_area  :boolean
#  number          :integer
#  number_of_flats :integer
#  service_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  wing_id         :bigint           not null
#
# Indexes
#
#  index_floors_on_wing_id  (wing_id)
#
# Foreign Keys
#
#  fk_rails_...  (wing_id => wings.id)
#
FactoryBot.define do
  factory :floor do
    number { 1 }
    number_of_flats { 1 }
    is_refuge_area { false }
    wing { nil }
    fire_exebution { false }
    service_at { '2023-04-05 21:23:43' }
  end
end
