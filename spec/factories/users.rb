FactoryBot.define do
  factory :user do
    username { "MyString" }
    password { "MyString" }
    email { "MyString" }
    status { 1 }
    is_admin { false }
    token { "MyString" }
    society { nil }
    type { 1 }
    is_primary_user { false }
  end
end
