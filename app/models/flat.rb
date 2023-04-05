class Flat < ApplicationRecord
  belongs_to :floor
  belongs_to :owner, class_name: "User"
  belongs_to :tenant, class_name: "User"
end
