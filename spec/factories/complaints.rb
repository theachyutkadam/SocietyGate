# frozen_string_literal: true

# == Schema Information
#
# Table name: complaints
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flat_id     :bigint           not null
#  sector_id   :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_complaints_on_flat_id    (flat_id)
#  index_complaints_on_sector_id  (sector_id)
#  index_complaints_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (sector_id => sectors.id)
#  fk_rails_...  (user_id => users.id)
#
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
