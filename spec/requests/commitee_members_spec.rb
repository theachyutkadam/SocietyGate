# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CommiteeMembers', type: :request do
  describe 'GET /commitee_members' do
    it 'works! (now write some real specs)' do
      get commitee_members_path
      expect(response).to have_http_status(200)
    end
  end
end
