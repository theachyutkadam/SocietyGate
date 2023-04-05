# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Commities', type: :request do
  describe 'GET /commities' do
    it 'works! (now write some real specs)' do
      get commities_path
      expect(response).to have_http_status(200)
    end
  end
end
