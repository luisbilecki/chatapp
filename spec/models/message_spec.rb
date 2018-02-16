require 'rails_helper'

describe Message, :type => :model do

  context 'Valid Factory' do
    it 'has a valid factory' do
      expect(build(:message)).to be_valid
    end
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:mtype) }
    it { is_expected.to validate_length_of(:body).
              is_at_least(2).
              is_at_most(1000) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chat_room) }
  end

end
