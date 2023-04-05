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
    user { nil }
    name { 'MyString' }
    images { 'MyString' }
    description { 'MyText' }
  end
end
