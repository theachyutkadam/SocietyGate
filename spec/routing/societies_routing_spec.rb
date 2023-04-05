# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocietiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/societies').to route_to('societies#index')
    end

    it 'routes to #show' do
      expect(get: '/societies/1').to route_to('societies#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/societies').to route_to('societies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/societies/1').to route_to('societies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/societies/1').to route_to('societies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/societies/1').to route_to('societies#destroy', id: '1')
    end
  end
end
