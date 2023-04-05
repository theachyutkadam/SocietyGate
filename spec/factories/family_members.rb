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
    first_name { "MyString" }
    last_name { "MyString" }
    contact { "MyString" }
    birth_date { "2023-04-05" }
    gender { 1 }
    flat { nil }
    pan_card_number { "MyString" }
    adhaar_card_number { "MyString" }
    avatar_url { "MyString" }
    maritial_status { 1 }
    status { 1 }
    relation_with { 1 }
  end
end
