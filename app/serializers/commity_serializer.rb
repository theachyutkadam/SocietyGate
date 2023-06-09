# frozen_string_literal: true

# == Schema Information
#
# Table name: commities
#
#  id            :bigint           not null, primary key
#  members_limit :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  building_id   :bigint           not null
#
# Indexes
#
#  index_commities_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
include Rails.application.routes.url_helpers

class CommitySerializer < ActiveModel::Serializer
  attributes :id, :link, :title, :members_limit
  has_one :building
  def link
    api_commity_url(object)
  end
end
