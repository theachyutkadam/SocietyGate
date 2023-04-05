# == Schema Information
#
# Table name: commities
#
#  id            :bigint           not null, primary key
#  members_limit :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  sector_id     :bigint           not null
#
# Indexes
#
#  index_commities_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (sector_id => sectors.id)
#
class CommitySerializer < ActiveModel::Serializer
  attributes :id, :title, :members_limit
  has_one :sector
end
