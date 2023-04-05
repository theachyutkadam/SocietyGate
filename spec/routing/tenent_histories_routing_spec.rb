# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TenentHistoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tenent_histories').to route_to('tenent_histories#index')
    end

    it 'routes to #show' do
      expect(get: '/tenent_histories/1').to route_to('tenent_histories#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/tenent_histories').to route_to('tenent_histories#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/tenent_histories/1').to route_to('tenent_histories#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tenent_histories/1').to route_to('tenent_histories#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/tenent_histories/1').to route_to('tenent_histories#destroy', id: '1')
    end
  end
end
