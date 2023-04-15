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
include Rails.application.routes.url_helpers

class TenentHistorySerializer < ActiveModel::Serializer
  attributes :id, :link, :move_in_at, :move_out_at
  has_one :tenant
  has_one :flat
  def link
    api_tenent_history_url(object)
  end
end
