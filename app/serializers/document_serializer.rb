# frozen_string_literal: true

# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  description :text
#  images      :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
include Rails.application.routes.url_helpers

class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :link, :name, :images, :description
  has_one :user
  def link
    api_document_url(object)
  end
end
