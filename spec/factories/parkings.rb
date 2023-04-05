FactoryBot.define do
  factory :parking do
    number { "MyString" }
    is_covered { false }
    size_in_feet { 1 }
    sector { nil }
    owner { nil }
    flat { nil }
  end
end
