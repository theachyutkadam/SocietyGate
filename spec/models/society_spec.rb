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
require "rails_helper"

RSpec.describe Society, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
