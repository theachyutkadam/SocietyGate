# frozen_string_literal: true

# == Schema Information
#
# Table name: gate_entries
#
#  id                 :bigint           not null, primary key
#  contact            :string
#  entry_type         :integer
#  first_name         :string
#  gender             :integer
#  last_name          :string
#  person_image_url   :string
#  status             :integer
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
  # enum gender: { male: 0, female: 1, other: 2 }
  enum entry_type: { guest: 0, delivery: 1, home_maintenance: 2, other: 3 }
  enum status: { pending: 0, allowed: 1, canceld: 2, exit: 3 }, _default: "pending"
end
