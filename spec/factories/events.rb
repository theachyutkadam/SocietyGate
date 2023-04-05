FactoryBot.define do
  factory :event do
    name { "MyString" }
    sector { nil }
    start_at { "2023-04-05 21:24:08" }
    end_at { "2023-04-05 21:24:08" }
    is_private { "MyString" }
    flat { nil }
  end
end
