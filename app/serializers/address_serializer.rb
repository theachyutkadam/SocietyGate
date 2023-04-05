# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  district    :string
#  flat_number :integer
#  pin_code    :string
#  road        :string
#  state       :string
#  taluka      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class AddressSerializer < ActiveModel::Serializer
  attributes :id, :building, :flat_number, :road, :taluka, :district, :state, :pin_code
  has_one :user
end
