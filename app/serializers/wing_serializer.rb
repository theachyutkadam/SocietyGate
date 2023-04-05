# frozen_string_literal: true

# == Schema Information
#
# Table name: wings
#
#  id              :bigint           not null, primary key
#  name            :string
#  number_of_lifts :integer
#  structure       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sector_id       :bigint           not null
#
# Indexes
#
#  index_wings_on_sector_id  (sector_id)
#
# Foreign Keys
#
#  fk_rails_...  (sector_id => sectors.id)
#
class WingSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_lifts, :structure
  has_one :sector
end
