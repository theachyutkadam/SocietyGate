# frozen_string_literal: true

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
include Rails.application.routes.url_helpers

class FamilyMemberSerializer < ActiveModel::Serializer
  attributes :id, :link, :first_name, :last_name, :contact, :birth_date, :gender, :pan_card_number, :adhaar_card_number,
             :avatar_url, :maritial_status, :status, :relation_with
  has_one :flat

  def birth_date
    object.birth_date.to_fs(:long)
  end
  def link
    api_family_member_url(object)
  end
end
  def link
    api_address_url(object)
  end
end
