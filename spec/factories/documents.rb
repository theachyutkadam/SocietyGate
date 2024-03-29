# frozen_string_literal: true

# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  description :text
#  images      :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :document do
    name { ["Pan Card", "Addhar Card", "Birth Certificate", "Driving Licence"].shuffle.sample }
    images { "None" }
    description { Faker::Lorem.question(word_count: 10) }
  end
end
