# frozen_string_literal: true

# == Schema Information
#
# Table name: floors
#
#  id              :bigint           not null, primary key
#  fire_exebution  :boolean
#  is_refuge_area  :boolean
#  number          :string
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
    number { Faker::Base.numerify("###") }
    number_of_flats { Faker::Base.numerify("##") }
    is_refuge_area { false }
    fire_exebution { false }
    service_at { Date.today }
  end
end
