FactoryBot.define do
  factory :complaint do
    title { "MyString" }
    type { 1 }
    user { nil }
    description { "MyText" }
    sector { nil }
    flat { nil }
  end
end
