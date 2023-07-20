# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  is_admin        :boolean
#  is_primary_user :boolean
#  password        :string
#  status          :integer
#  token           :string           not null
#  user_type       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  society_id      :bigint           not null
#
# Indexes
#
#  index_users_on_email       (email) UNIQUE
#  index_users_on_society_id  (society_id)
#  index_users_on_token       (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
class User < ApplicationRecord
  include AASM

  belongs_to :society
  has_one :user_information, dependent: :destroy
  has_one :commitee_member, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :complaints, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :parkings, class_name: "Parking", dependent: :destroy, foreign_key: :owner_id
  has_many :flat_tenants, class_name: "Flat", dependent: :destroy, foreign_key: :tenant_id
  has_many :flat_owners, class_name: "Flat", dependent: :destroy, foreign_key: :owner_id
  has_many :tenant_histories, class_name: "TenantHistory", dependent: :destroy, foreign_key: :tenant_id
  has_many :flats, dependent: :destroy

  enum status: { active: 0, pending: 1, blocked: 2, deleted: 3 }, _default: "active"
  enum user_type: { admin: 0, owner: 1, tenant: 2 }, _default: "owner"

  validates :is_admin, :is_primary_user, inclusion: [true, false]
  validates :email, :password, presence: true
  validates :email, :token, uniqueness: true
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
      transitions from: %i[active pending blocked], to: :deleted
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
