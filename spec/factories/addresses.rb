FactoryBot.define do
  factory :address do
    building { "MyString" }
    flat_number { 1 }
    road { "MyString" }
    taluka { "MyString" }
    district { "MyString" }
    state { "MyString" }
    pin_code { "MyString" }
    user { nil }
  end
end
