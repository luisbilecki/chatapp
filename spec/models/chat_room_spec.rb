require 'rails_helper'

describe ChatRoom, :type => :model do

  context 'Valid Factory' do
    it 'has a valid factory' do
      expect(build(:chat_room)).to be_valid
    end
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:messages) }
  end

end
