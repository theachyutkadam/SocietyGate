# frozen_string_literal: true

# == Schema Information
#
# Table name: commitee_members
#
#  id            :bigint           not null, primary key
#  designation   :integer
#  members_count :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  commity_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_commitee_members_on_commity_id  (commity_id)
#  index_commitee_members_on_user_id     (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (commity_id => commities.id)
#  fk_rails_...  (user_id => users.id)
#
class CommiteeMember < ApplicationRecord
  belongs_to :user
  belongs_to :commity
  enum designation: { admin: 0, suprevisor: 1, member: 2 }

  validates :name, :members_count, :designation, presence: true
  validates :members_count, numericality: true
  validate :check_members_limit

  def check_members_limit
    return unless CommiteeMember.where(commity_id: commity.id).count > commity.members_limit

    errors.add(:members_count,
               "limit over")
  end
end
