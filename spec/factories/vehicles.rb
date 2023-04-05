FactoryBot.define do
  factory :vehicle do
    number { "MyString" }
    name { "MyString" }
    type { 1 }
    color { "MyString" }
    flat { nil }
    user { nil }
  end
end
