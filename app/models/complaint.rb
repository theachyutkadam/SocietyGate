# frozen_string_literal: true

# == Schema Information
#
# Table name: complaints
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flat_id     :bigint           not null
#  sector_id   :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_complaints_on_flat_id    (flat_id)
#  index_complaints_on_sector_id  (sector_id)
#  index_complaints_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (sector_id => sectors.id)
#  fk_rails_...  (user_id => users.id)
#
class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :sector
  belongs_to :flat
  enum complaint_type: { electric: 0, plumbing: 1, gas_connection: 2, carpenter: 3, other: 4 }
end
