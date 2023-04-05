FactoryBot.define do
  factory :user_information do
    first_name { "MyString" }
    middle_name { "MyString" }
    last_name { "MyString" }
    contact { "MyString" }
    gender { 1 }
    birth_date { "2023-04-05" }
    pan_card_number { "MyString" }
    adhaar_card_number { "MyString" }
    is_handicap { false }
    handicap_details { "MyText" }
    maritial_status { 1 }
    user { nil }
  end
end
