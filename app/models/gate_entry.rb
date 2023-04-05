# frozen_string_literal: true

# == Schema Information
#
# Table name: gate_entries
#
#  id                 :bigint           not null, primary key
#  contact            :string
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  person_image_url   :string
#  status             :integer
#  type               :integer
#  vehicale_image_url :string
#  vehicle_number     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  flat_id            :bigint           not null
#
# Indexes
#
#  index_gate_entries_on_flat_id  (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#
class GateEntry < ApplicationRecord
  belongs_to :flat
end
