class TenentHistory < ApplicationRecord
  belongs_to :flat
  belongs_to :tenant, class_name: "User"
end
