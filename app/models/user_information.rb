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
require "socket"
class UserInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  def avatar_url
    ip = Socket.ip_address_list.detect(&:ipv4_private?)
    return unless avatar.attached?

    Rails.application.routes.url_helpers.url_for(avatar).gsub! "localhost:", "#{ip.ip_address}:"
  end

  enum gender: { male: 0, female: 1, other: 2 }
  enum maritial_status: { single: 0, married: 1, devorsed: 2 }

  validates :adhaar_card_number,
            :birth_date,
            :contact,
            :first_name,
            :gender,
            :last_name,
            :maritial_status,
            :middle_name,
            presence: true

  validates :is_handicap, inclusion: [true, false]
  validates :gender, inclusion: { in: genders.keys }
  validates :adhaar_card_number, numericality: true, length: { is: 12 }
  validates :contact, numericality: true, length: { is: 10 }
  validates :pan_card_number, length: { is: 10 }
  validates :user_id, :pan_card_number, :adhaar_card_number, :contact, uniqueness: true
  validate :handicap_description_required?

  def handicap_description_required?
    errors.add(:handicap_details, "can't be blank") if is_handicap
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
