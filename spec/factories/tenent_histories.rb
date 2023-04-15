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
    move_in_at { Faker::Date.backward(days: 2000) }
    move_out_at { Faker::Date.backward(days: 25) }
  end
end
