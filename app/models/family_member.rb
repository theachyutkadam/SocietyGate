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
class FamilyMember < ApplicationRecord
  belongs_to :flat
  enum gender: { male: 0, female: 1, transgender: 2 }
  enum maritial_status: { single: 0, married: 1, devorsed: 2 }
  enum status: { active: 0, pending: 1, blocked: 2, closed: 3 }, _default: "active"
  enum relation_with: { mother: 0, father: 1, wife: 2, child: 3, brother: 4, sister: 5, other: 6 }

  validates :adhaar_card_number,
            :birth_date,
            :contact,
            :first_name,
            :gender,
            :last_name,
            :maritial_status,
            :relation_with,
            :status, presence: true
  validates :contact, numericality: true, length: { is: 10 }
  validates :adhaar_card_number, numericality: true, length: { is: 12 }
  validates :contact, :adhaar_card_number, uniqueness: true
end
