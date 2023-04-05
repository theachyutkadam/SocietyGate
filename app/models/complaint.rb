class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :sector
  belongs_to :flat
end
