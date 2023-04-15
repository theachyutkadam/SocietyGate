# frozen_string_literal: true

# == Schema Information
#
# Table name: family_members
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  avatar_url         :string
#  birth_date         :date
#  contact            :string
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  maritial_status    :integer
#  pan_card_number    :string
#  relation_with      :integer
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  flat_id            :bigint           not null
#
# Indexes
#
#  index_family_members_on_flat_id  (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
FactoryBot.define do
  factory :family_member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Base.numerify("##########") }
    birth_date { 18.years.ago }
    gender { FamilyMember.genders.keys.sample }
    maritial_status { FamilyMember.maritial_statuses.keys.sample }
    pan_card_number { Faker::Base.bothify("?????####?") }
    adhaar_card_number { Faker::Number.number(digits: 12) }
    # avatar_url { "MyString" }
    status { FamilyMember.statuses.keys.sample }
    relation_with { FamilyMember.relation_withs.keys.sample }
  end
end
