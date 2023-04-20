# frozen_string_literal: true

# == Schema Information
#
# Table name: family_members
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  avatar_url         :string
#  birth_date         :date
#  contact            :string           not null
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  maritial_status    :integer
#  pan_card_number    :string
#  relation_with      :integer
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  flat_id            :bigint           not null
#
# Indexes
#
#  index_family_members_on_adhaar_card_number  (adhaar_card_number) UNIQUE
#  index_family_members_on_contact             (contact) UNIQUE
#  index_family_members_on_flat_id             (flat_id)
#  index_family_members_on_pan_card_number     (pan_card_number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
require "rails_helper"

RSpec.describe FamilyMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
