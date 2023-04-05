class Flat < ApplicationRecord
  belongs_to :owner
  belongs_to :floor
  belongs_to :tenant
end
