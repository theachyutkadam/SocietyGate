FactoryBot.define do
  factory :flat do
    number { 1 }
    owner { nil }
    floor { nil }
    area_in_feet { 1 }
    is_rented { false }
    tenant { nil }
    structure { 1 }
    letter_box_number { "MyString" }
    electricity_meter_number { "MyString" }
    gas_meter_number { "MyString" }
  end
end
