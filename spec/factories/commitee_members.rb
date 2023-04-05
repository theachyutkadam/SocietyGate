FactoryBot.define do
  factory :commitee_member do
    name { "MyString" }
    user { nil }
    members_count { 1 }
    commity { nil }
    designation { 1 }
  end
end
