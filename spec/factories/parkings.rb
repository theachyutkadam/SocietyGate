# == Schema Information
#
# Table name: parkings
#
#  id           :bigint           not null, primary key
#  is_covered   :boolean
#  number       :string
#  size_in_feet :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flat_id      :bigint           not null
#  owner_id     :bigint           not null
#  sector_id    :bigint           not null
#
# Indexes
#
#  index_parkings_on_flat_id    (flat_id)
#  index_parkings_on_owner_id   (owner_id)
#  index_parkings_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (sector_id => sectors.id)
#
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
