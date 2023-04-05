# == Schema Information
#
# Table name: family_members
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string
#  avatar_url         :string
#  birth_date         :date
#  contact            :string
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
#  index_family_members_on_flat_id  (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
class FamilyMember < ApplicationRecord
  belongs_to :flat
end
