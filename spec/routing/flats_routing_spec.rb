# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlatsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/flats').to route_to('flats#index')
    end

    it 'routes to #show' do
      expect(get: '/flats/1').to route_to('flats#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/flats').to route_to('flats#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/flats/1').to route_to('flats#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/flats/1').to route_to('flats#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/flats/1').to route_to('flats#destroy', id: '1')
    end
  end
end
