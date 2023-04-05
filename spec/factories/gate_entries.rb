FactoryBot.define do
  factory :gate_entry do
    type { 1 }
    status { 1 }
    flat { nil }
    vehicle_number { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    gender { 1 }
    contact { "MyString" }
    vehicale_image_url { "MyString" }
    person_image_url { "MyString" }
  end
end
