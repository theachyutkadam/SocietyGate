class TenentHistory < ApplicationRecord
  belongs_to :tenant
  belongs_to :flat
end
