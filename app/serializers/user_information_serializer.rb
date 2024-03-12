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
include Rails.application.routes.url_helpers

class UserInformationSerializer < ActiveModel::Serializer
  attributes :id, :link, :first_name, :middle_name, :last_name, :contact, :gender, :birth_date, :pan_card_number,
             :adhaar_card_number, :is_handicap, :handicap_details, :maritial_status, :avatar_url, :full_name
  has_one :user

  def birth_date
    object.birth_date.to_fs(:long)
  end

  def full_name
    object.full_name
  rescue StandardError
    nil
  end

  def link
    api_user_information_url(object)
  end

  def avatar_url
    object.avatar_url
  end
end
