# frozen_string_literal: true

# == Schema Information
#
# Table name: complaints
#
#  id             :bigint           not null, primary key
#  complaint_type :integer
#  description    :text
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  building_id    :bigint           not null
#  flat_id        :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_complaints_on_building_id  (building_id)
#  index_complaints_on_flat_id      (flat_id)
#  index_complaints_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (user_id => users.id)
#
class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :building
  belongs_to :flat

  enum status: { active: 0, pending: 1, completed: 2, work_in_progress: 3 }, _default: "pending"
  enum complaint_type: { electric: 0, plumbing: 1, gas_connection: 2, carpenter: 3, other: 4 }

  validates :status, :complaint_type, :title, presence: true
end
