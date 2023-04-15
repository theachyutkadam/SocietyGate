# frozen_string_literal: true

# == Schema Information
#
# Table name: tenent_histories
#
#  id          :bigint           not null, primary key
#  move_in_at  :date
#  move_out_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  flat_id     :bigint           not null
#  tenant_id   :bigint           not null
#
# Indexes
#
#  index_tenent_histories_on_flat_id    (flat_id)
#  index_tenent_histories_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (tenant_id => users.id)
#
class TenentHistory < ApplicationRecord
  belongs_to :flat
  belongs_to :tenant, class_name: "User"

  validates :move_in_at, presence: true
  validate :move_out_date_is_greater?

  def move_out_date_is_greater?
    return unless move_out_at

    errors.add(:move_out_at, "should be greather than move_in_at") if move_out_at <= move_in_at
  end
end
