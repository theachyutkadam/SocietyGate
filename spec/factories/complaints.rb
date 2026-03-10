# frozen_string_literal: true

# == Schema Information
#
# Table name: complaints
#
#  id             :bigint           not null, primary key
#  complaint_type :integer
#  description    :text
#  status         :integer
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
FactoryBot.define do
  factory :complaint do
    association :user
    association :building
    association :flat

    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }

    status { 0 }
    complaint_type { 0 }
  end

end
