class Parking < ApplicationRecord
  belongs_to :sector
  belongs_to :owner
  belongs_to :flat
end
