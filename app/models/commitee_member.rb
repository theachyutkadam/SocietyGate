class CommiteeMember < ApplicationRecord
  belongs_to :user
  belongs_to :commity
end
