FactoryBot.define do
  factory :floor do
    number { 1 }
    number_of_flats { 1 }
    is_refuge_area { false }
    wing { nil }
    fire_exebution { false }
    service_at { "2023-04-05 21:23:43" }
  end
end
