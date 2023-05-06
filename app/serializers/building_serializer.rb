# frozen_string_literal: true

# == Schema Information
#
# Table name: buildings
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
#  index_buildings_on_society_id  (society_id)
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
include Rails.application.routes.url_helpers

class BuildingSerializer < ActiveModel::Serializer
  attributes :id, :link, :name, :location, :status, :society
  def link
    api_building_url(object)
  end
end
