# frozen_string_literal: true

# == Schema Information
#
# Table name: amenities
#
#  id                   :bigint           not null, primary key
#  end_time             :datetime
#  fee                  :float
#  is_paid              :boolean
#  name                 :string
#  only_for             :integer
#  start_time           :datetime
#  terms_and_conditions :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  sector_id            :bigint           not null
#
# Indexes
#
#  index_amenities_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (sector_id => sectors.id)
#
FactoryBot.define do
  factory :amenity do
    name { 'MyString' }
    start_time { '2023-04-05 21:23:49' }
    end_time { '2023-04-05 21:23:49' }
    is_paid { false }
    only_for { 1 }
    fee { 1.5 }
    sector { nil }
    terms_and_conditions { 'MyText' }
  end
end
