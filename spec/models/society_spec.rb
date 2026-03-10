# frozen_string_literal: true

# == Schema Information
#
# Table name: societies
#
#  id                  :bigint           not null, primary key
#  address             :text
#  city                :string
#  contact             :string           not null
#  email               :string           not null
#  location            :string
#  name                :string           not null
#  registration_number :string           not null
#  state               :string
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_societies_on_contact              (contact) UNIQUE
#  index_societies_on_email                (email) UNIQUE
#  index_societies_on_name                 (name) UNIQUE
#  index_societies_on_registration_number  (registration_number) UNIQUE
#
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Society, type: :model do
  # This ensures we have a clean state and helps debugging if the factory itself is broken
  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:society)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:users).dependent(:destroy) }
    it { is_expected.to have_many(:buildings).dependent(:destroy) }
  end

  describe 'Enums' do
    # Validating the enum values defined in the model
    it { is_expected.to define_enum_for(:status).with_values(active: 0, blocked: 1, closed: 2) }

    it 'sets the default status to active' do
      expect(described_class.new.status).to eq('active')
    end
  end

  describe 'Validations' do
    # We use build_stubbed for speed unless testing uniqueness
    subject { build(:society) }

    describe 'Presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:contact) }
      it { is_expected.to validate_presence_of(:registration_number) }
      it { is_expected.to validate_presence_of(:city) }
      it { is_expected.to validate_presence_of(:state) }
      it { is_expected.to validate_presence_of(:location) }
    end

    describe 'Format and Length' do
      it { is_expected.to validate_numericality_of(:contact) }
      it { is_expected.to validate_length_of(:contact).is_equal_to(10) }
    end

    describe 'Uniqueness' do
      # Uniqueness validation requires one record to exist in the database
      # We use create! here to catch any database-level errors immediately
      before { create(:society) }

      it { is_expected.to validate_uniqueness_of(:name) }
      # Case insensitivity check is often required for emails
      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_uniqueness_of(:registration_number) }

      # Fix: Added .ignoring_case_sensitivity because numeric strings (contact)
      # cannot be tested for case-swapping by the matcher.
      it { is_expected.to validate_uniqueness_of(:contact).ignoring_case_sensitivity }
    end
  end

  describe 'Database Indexes' do
    it { is_expected.to have_db_index(:contact).unique(true) }
    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to have_db_index(:name).unique(true) }
    it { is_expected.to have_db_index(:registration_number).unique(true) }
  end
end