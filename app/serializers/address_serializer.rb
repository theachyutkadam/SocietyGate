# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  city        :string
#  flat_number :integer
#  pin_code    :string
#  state       :string
#  street_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
include Rails.application.routes.url_helpers

class AddressSerializer < ActiveModel::Serializer
  attributes :id, :link, :building, :city, :flat_number, :pin_code, :state, :street_name, :user_id
  has_one :user
  def link
    api_address_url(object)
  end
end
