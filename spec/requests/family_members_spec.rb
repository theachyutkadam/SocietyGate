# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FamilyMembers', type: :request do
  describe 'GET /family_members' do
    it 'works! (now write some real specs)' do
      get family_members_path
      expect(response).to have_http_status(200)
    end
  end
end
