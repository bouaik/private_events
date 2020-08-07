require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(6) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(30) }
    it { should validate_presence_of(:date) }
  end

  describe 'associations' do
    it { should belong_to(:creator).class_name(:User) }
    it do
      should have_many(:event_attendances)
        .with_foreign_key(:attendances_id)
    end
    it do
      should have_many(:guests)
        .through(:event_attendances)
        .source(:attende)
    end
  end
end
