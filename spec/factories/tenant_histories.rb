# frozen_string_literal: true

# == Schema Information
#
# Table name: tenant_histories
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
#  index_tenant_histories_on_flat_id    (flat_id)
#  index_tenant_histories_on_tenant_id  (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (tenant_id => users.id)
#
FactoryBot.define do
  factory :tenant_history do
    association :tenant, factory: :user
    association :flat

    move_in_at { 1.year.ago }
    move_out_at { Date.today }
  end

end
