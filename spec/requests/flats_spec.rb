# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Flats', type: :request do
  describe 'GET /flats' do
    it 'works! (now write some real specs)' do
      get flats_path
      expect(response).to have_http_status(200)
    end
  end
end
