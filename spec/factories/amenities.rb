FactoryBot.define do
  factory :amenity do
    name { "MyString" }
    start_time { "2023-04-05 21:23:49" }
    end_time { "2023-04-05 21:23:49" }
    is_paid { false }
    only_for { 1 }
    fee { 1.5 }
    sector { nil }
    terms_and_conditions { "MyText" }
  end
end
