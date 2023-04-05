# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommiteeMembersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/commitee_members').to route_to('commitee_members#index')
    end

    it 'routes to #show' do
      expect(get: '/commitee_members/1').to route_to('commitee_members#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/commitee_members').to route_to('commitee_members#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/commitee_members/1').to route_to('commitee_members#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/commitee_members/1').to route_to('commitee_members#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/commitee_members/1').to route_to('commitee_members#destroy', id: '1')
    end
  end
end
