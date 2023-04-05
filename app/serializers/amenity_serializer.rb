# frozen_string_literal: true

# == Schema Information
#
# Table name: amenities
#
#  id                   :bigint           not null, primary key
#  end_time             :datetime
#  fee                  :float
#  is_paid              :boolean
#  name                 :string
#  only_for             :integer
#  start_time           :datetime
#  terms_and_conditions :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  sector_id            :bigint           not null
#
# Indexes
#
#  index_amenities_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (sector_id => sectors.id)
#
class AmenitySerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :end_time, :is_paid, :only_for, :fee, :terms_and_conditions
  has_one :sector
end
