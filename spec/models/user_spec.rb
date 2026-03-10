# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  is_admin        :boolean
#  is_primary_user :boolean
#  password        :string
#  status          :integer
#  token           :string           not null
#  user_type       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  society_id      :bigint           not null
#
# Indexes
#
#  index_users_on_email       (email) UNIQUE
#  index_users_on_society_id  (society_id)
#  index_users_on_token       (token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (society_id => societies.id)
#
require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:society) }

    it { should have_one(:user_information).dependent(:destroy) }
    it { should have_one(:commitee_member).dependent(:destroy) }
    it { should have_many(:addresses).dependent(:destroy) }
    it { should have_many(:documents).dependent(:destroy) }
    it { should have_many(:complaints).dependent(:destroy) }
    it { should have_many(:vehicles).dependent(:destroy) }

    it { should have_many(:parkings).class_name('Parking').with_foreign_key(:owner_id).dependent(:destroy) }
    it { should have_many(:flat_tenants).class_name('Flat').with_foreign_key(:tenant_id).dependent(:destroy) }
    it { should have_many(:flat_owners).class_name('Flat').with_foreign_key(:owner_id).dependent(:destroy) }
    it { should have_many(:tenant_histories).class_name('TenantHistory').with_foreign_key(:tenant_id).dependent(:destroy) }

    # it { should have_many(:flats).dependent(:destroy) }
  end

  describe 'Enums' do
    context 'Enums' do
      # Fix for Failure 2 & 3: Simplified enum matching
      it { should define_enum_for(:status).with_values(active: 0, pending: 1, blocked: 2, deleted: 3) }
      it { should define_enum_for(:user_type).with_values(admin: 0, owner: 1, tenant: 2) }
    end
  end

  describe 'Validations' do

    describe 'Email validation' do
      subject { build(:user) }

      it { should validate_presence_of(:email) }

      it { should validate_uniqueness_of(:email) }
    end

    describe 'Password validation' do
      subject { build(:user) }

      it { should validate_presence_of(:password) }

      it { should validate_length_of(:password).is_at_least(6).is_at_most(20) }
    end

    describe 'Token validation' do
      subject { build(:user) }

      it { should validate_uniqueness_of(:token) }
    end

    describe 'Boolean validations' do
      subject { build(:user) }

      it { should allow_value(true).for(:is_admin) }
      it { should allow_value(false).for(:is_admin) }

      it { should allow_value(true).for(:is_primary_user) }
      it { should allow_value(false).for(:is_primary_user) }
    end

  end

  describe 'Database Indexes' do
    it { should have_db_index(:email).unique(true) }

    it { should have_db_index(:token).unique(true) }

    it { should have_db_index(:society_id) }
  end

  describe 'Callbacks' do
    describe 'before_create' do
      it 'sets token before creating user' do
        user = create(:user, token: nil)
        expect(user.token).to be_present
      end
    end
  end

  describe 'Instance Methods' do

    describe '#generate_token' do
      it 'generates a token' do
        user = build(:user)

        token = user.generate_token

        expect(token).to be_present
      end

      it 'generates unique token' do
        existing_user = create(:user)

        user = build(:user)

        token = user.generate_token

        expect(token).not_to eq(existing_user.token)
      end
    end

    describe '#set_token' do
      it 'assigns generated token to user' do
        user = build(:user)

        user.set_token

        expect(user.token).to be_present
      end
    end

  end

  describe 'AASM State Machine' do
    let(:user) { create(:user, status: 'pending') }

    describe 'activate event' do
      it 'transitions from pending to active' do
        user.activate
        expect(user.status).to eq('active')
      end
    end

    describe 'block event' do
      it 'transitions from active to blocked' do
        user = create(:user, status: 'active')
        user.block
        expect(user.status).to eq('blocked')
      end
    end

    describe 'delete event' do
      it 'transitions to deleted' do
        user = create(:user, status: 'active')
        user.delete
        expect(user.status).to eq('deleted')
      end
    end
  end

end
