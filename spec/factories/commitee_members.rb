# frozen_string_literal: true

# == Schema Information
#
# Table name: commitee_members
#
#  id            :bigint           not null, primary key
#  designation   :integer
#  members_count :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  commity_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_commitee_members_on_commity_id  (commity_id)
#  index_commitee_members_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (commity_id => commities.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :commitee_member do
    name { "MyString" }
    user { nil }
    members_count { 1 }
    commity { nil }
    designation { 1 }
  end
end
