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
