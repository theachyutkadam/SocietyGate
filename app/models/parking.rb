class Parking < ApplicationRecord
  belongs_to :flat
  belongs_to :sector
  belongs_to :owner, class_name: "User"
end
