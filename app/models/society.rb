# frozen_string_literal: true

# == Schema Information
#
# Table name: societies
#
#  id                  :bigint           not null, primary key
#  address             :text
#  city                :string
#  contact             :string           not null
#  email               :string           not null
#  location            :string
#  name                :string           not null
#  registration_number :string           not null
#  state               :string
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_societies_on_contact              (contact) UNIQUE
#  index_societies_on_email                (email) UNIQUE
#  index_societies_on_name                 (name) UNIQUE
#  index_societies_on_registration_number  (registration_number) UNIQUE
#
class Society < ApplicationRecord
  enum status: { active: 0, blocked: 1, closed: 2 }, _default: "active"

  validates :city, :contact, :email, :location, :name, :registration_number, :state, presence: true
  validates :contact, numericality: true, length: { is: 10 }
end
