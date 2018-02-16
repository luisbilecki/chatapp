require 'rails_helper'

describe User, :type => :model do

  context 'Valid Factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:chat_rooms) }
    it { is_expected.to have_many(:messages) }
  end

  context 'Uniqueness' do
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

end
