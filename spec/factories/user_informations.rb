# frozen_string_literal: true

# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string           not null
#  birth_date         :date
#  contact            :string           not null
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_user_informations_on_adhaar_card_number  (adhaar_card_number) UNIQUE
#  index_user_informations_on_contact             (contact) UNIQUE
#  index_user_informations_on_pan_card_number     (pan_card_number) UNIQUE
#  index_user_informations_on_user_id             (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_information do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    contact { Faker::Base.numerify("##########") }
    birth_date { 18.years.ago }
    gender { UserInformation.genders.keys.sample }
    maritial_status { UserInformation.maritial_statuses.keys.sample }
    pan_card_number { Faker::Base.bothify("?????####?") }
    adhaar_card_number { Faker::Number.number(digits: 12) }
    is_handicap { false }
    handicap_details { Faker::Lorem.question(word_count: 4) }
    # avatar_url { Faker::Avatar.image }
    # transient do
    #   # avatar { file_fixture("avatar.jpg") }
    #   after :build do |user_information, evaluator|
    #     user_information.avatar.attach(
    #       io: evaluator.avatar.open,
    #       filename: Faker::Avatar.image,
    #     )
    #   end
    # end
  end
end
