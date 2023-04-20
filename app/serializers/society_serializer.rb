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
include Rails.application.routes.url_helpers

class SocietySerializer < ActiveModel::Serializer
  attributes :id, :link, :name, :city, :state, :location, :status, :registration_number, :contact, :email, :address
  def link
    api_society_url(object)
  end
end
