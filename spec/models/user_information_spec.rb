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
require "rails_helper"

RSpec.describe UserInformation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
