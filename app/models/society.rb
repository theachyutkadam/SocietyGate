# frozen_string_literal: true

# == Schema Information
#
# Table name: societies
#
#  id                  :bigint           not null, primary key
#  address             :text
#  city                :string
#  contact             :string
#  email               :string
#  location            :string
#  name                :string
#  registration_number :string
#  state               :string
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Society < ApplicationRecord
end
