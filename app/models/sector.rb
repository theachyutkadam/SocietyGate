# == Schema Information
#
# Table name: sectors
#
#  id         :bigint           not null, primary key
#  location   :string
#  name       :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  society_id :bigint           not null
#
# Indexes
#
#  index_sectors_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
class Sector < ApplicationRecord
  belongs_to :society
end
