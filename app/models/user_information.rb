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
class UserInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar) if avatar.attached?
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

  validates :gender, inclusion: { in: genders.keys }
  validates :adhaar_card_number, numericality: true, length: { is: 12 }
  validates :contact, numericality: true, length: { is: 10 }
  validates :pan_card_number, length: { is: 10 }
  validates :user_id, :pan_card_number, :contact, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
