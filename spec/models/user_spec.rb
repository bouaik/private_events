require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Valiations' do
    it 'expect user to be valid' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('example@gmail.com').for(:email) }
  end

  describe 'Asociation' do
    it { should have_many(:events) }
    it { should have_many(:event_attendances) }
    it { should have_many(:attended_events).through(:event_attendances) }
  end
end
