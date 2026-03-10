# frozen_string_literal: true

# == Schema Information
#
# Table name: user_informations
#
#  id                 :bigint           not null, primary key
#  adhaar_card_number :string           not null
#  birth_date         :date
#  contact            :string           not null
#  first_name         :string
#  gender             :integer
#  handicap_details   :text
#  is_handicap        :boolean
#  last_name          :string
#  maritial_status    :integer
#  middle_name        :string
#  pan_card_number    :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_user_informations_on_adhaar_card_number  (adhaar_card_number) UNIQUE
#  index_user_informations_on_contact             (contact) UNIQUE
#  index_user_informations_on_pan_card_number     (pan_card_number) UNIQUE
#  index_user_informations_on_user_id             (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe UserInformation, type: :model do

  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:user_information)).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'ActiveStorage' do
    it { should have_one_attached(:avatar) }
  end

  describe 'Enums' do
    it do
      should define_enum_for(:gender)
        .with_values(male: 0, female: 1, other: 2)
    end

    it do
      should define_enum_for(:maritial_status)
        .with_values(single: 0, married: 1, devorsed: 2)
    end

    describe 'Enum Scopes' do
      describe 'gender scopes' do
        it 'returns only male users' do
          male = create(:user_information, gender: :male)
          create(:user_information, gender: :female)

          expect(UserInformation.male).to include(male)
        end
      end

      describe 'marital status scopes' do
        it 'returns married users' do
          married = create(:user_information, maritial_status: :married)
          create(:user_information, maritial_status: :single)

          expect(UserInformation.married).to include(married)
        end
      end
    end
  end



  describe 'Validations' do

    describe 'First name validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:first_name) }
    end

    describe 'Middle name validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:middle_name) }
    end

    describe 'Last name validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:last_name) }
    end

    describe 'Birth date validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:birth_date) }
    end

    describe 'Gender validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:gender) }
    end

    describe 'Marital status validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:maritial_status) }
    end

    describe 'Contact validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:contact) }

      it { should validate_length_of(:contact).is_equal_to(10) }

      it { should validate_numericality_of(:contact) }

      it { should validate_uniqueness_of(:contact).ignoring_case_sensitivity }
    end

    describe 'Adhaar validation' do
      subject { build(:user_information) }

      it { should validate_presence_of(:adhaar_card_number) }

      it { should validate_length_of(:adhaar_card_number).is_equal_to(12) }

      it { should validate_numericality_of(:adhaar_card_number) }

      it { should validate_uniqueness_of(:adhaar_card_number).ignoring_case_sensitivity }
    end

    describe 'PAN validation' do
      subject { build(:user_information) }

      it { should validate_length_of(:pan_card_number).is_equal_to(10) }

      it { should validate_uniqueness_of(:pan_card_number) }
    end

    describe 'Boolean validation' do
      subject { build(:user_information) }

      it { should allow_value(true).for(:is_handicap) }

      it { should allow_value(false).for(:is_handicap) }
    end

  end

  describe 'Custom Validations' do
    describe '#handicap_description_required?' do
      it 'adds error if handicap true and details missing' do
        user_info = build(:user_information, is_handicap: true, handicap_details: nil)

        user_info.valid?

        expect(user_info.errors[:handicap_details]).to include("can't be blank")
      end
    end
  end

  describe 'Database Indexes' do
    it { should have_db_index(:user_id).unique(true) }

    it { should have_db_index(:contact).unique(true) }

    it { should have_db_index(:pan_card_number).unique(true) }

    it { should have_db_index(:adhaar_card_number).unique(true) }
  end

  describe 'Instance Methods' do

    describe '#full_name' do
      it 'returns full name' do
        user_info = build(:user_information, first_name: "John", last_name: "Doe")

        expect(user_info.full_name).to eq("John Doe")
      end
    end
    describe 'Handicap validation logic' do
      it 'is valid when handicap false and no details' do
        user_info = build(:user_information, is_handicap: false, handicap_details: nil)

        expect(user_info).to be_valid
      end

      it 'is invalid when handicap true and details missing' do
        user_info = build(:user_information, is_handicap: true, handicap_details: nil)

        expect(user_info).not_to be_valid
      end
    end
  end

  describe 'Avatar Validations' do
    describe 'Avatar Attachment' do
      it 'can attach avatar' do
        user_info = build(:user_information)

        user_info.avatar.attach(
          io: File.open(Rails.root.join('spec/fixtures/files/avatar.png')),
          filename: 'avatar.png',
          content_type: 'image/png'
        )

        expect(user_info.avatar).to be_attached
      end
    end
    describe '#avatar_url' do
      it 'returns nil if avatar not attached' do
        user_info = build(:user_information)

        expect(user_info.avatar_url).to be_nil
      end

      it 'returns url when avatar attached' do
        user_info = build(:user_information, :with_avatar)

        expect(user_info.avatar_url).to be_present
      end
    end
  end
end
