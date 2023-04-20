# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  is_admin        :boolean
#  is_primary_user :boolean
#  password        :string
#  status          :integer
#  token           :string
#  user_type       :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  society_id      :bigint           not null
#
# Indexes
#
#  index_users_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
class User < ApplicationRecord
  include AASM

  belongs_to :society
  has_one :user_information, dependent: :destroy

  enum status: { active: 0, pending: 1, blocked: 2, deleted: 3 }, _default: "active"
  enum user_type: { admin: 0, owner: 1, tenant: 2 }, _default: "owner"

  validates :email, :password, :username, presence: true
  validates :email, :username, :token, uniqueness: true
  validates :status, inclusion: { in: statuses.keys }
  validates :password, length: { in: 6..20 }

  before_create :set_token

  aasm :status, timestamps: true do
    state :active, initial: true
    state :pending, :blocked, :deleted

    event :activate do
      transitions from: %i[pending blocked], to: :active
    end

    event :block do
      transitions from: %i[active pending], to: :blocked
    end

    event :delete do
      transitions from: %i[active pending blocked deleted], to: :deleted
    end
  end

  def generate_token
    user_token = Faker::Internet.device_token
    generate_token if User.where(token: user_token).any?
    user_token
  end

  def set_token
    self.token = generate_token
  end
end
