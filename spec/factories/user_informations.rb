# frozen_string_literal: true

# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  birth_date         :date
#  contact            :string
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_user_informations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_information do
    first_name { 'MyString' }
    middle_name { 'MyString' }
    last_name { 'MyString' }
    contact { 'MyString' }
    gender { 1 }
    birth_date { '2023-04-05' }
    pan_card_number { 'MyString' }
    adhaar_card_number { 'MyString' }
    is_handicap { false }
    handicap_details { 'MyText' }
    maritial_status { 1 }
    user { nil }
  end
end
