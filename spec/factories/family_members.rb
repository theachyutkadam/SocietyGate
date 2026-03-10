# frozen_string_literal: true

# == Schema Information
#
# Table name: family_members
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  avatar_url         :string
#  birth_date         :date
#  contact            :string           not null
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
#  index_family_members_on_adhaar_card_number  (adhaar_card_number) UNIQUE
#  index_family_members_on_contact             (contact) UNIQUE
#  index_family_members_on_flat_id             (flat_id)
#  index_family_members_on_pan_card_number     (pan_card_number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
FactoryBot.define do
  factory :family_member do
    association :flat

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Number.unique.number(digits: 10).to_s }
    birth_date { 20.years.ago }
    gender { FamilyMember.genders.keys.sample }
    relation_with { FamilyMember.relation_withs.keys.sample }
    pan_card_number { Faker::Alphanumeric.unique.alphanumeric(number: 10).upcase }
    adhaar_card_number { Faker::Number.unique.number(digits: 12).to_s }
    maritial_status { FamilyMember.maritial_statuses.keys.sample }
  end

end
