class Flat < ApplicationRecord
  belongs_to :floor
  belongs_to :owner
  belongs_to :tenant
end
