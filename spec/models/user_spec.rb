require 'rails_helper'

RSpec.describe User, type: :model do 

    describe "Valiations" do
        it { should validate_presence_of(:name) }
        it { should validate_length_of(:name).is_at_most(30) }
        it { should validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email).case_insensitive }
        it { should allow_value('example@gmail.com').for(:email) }
    end

    describe "Asociation" do
        it { should have_many(:events) }
        it { should have_many(:event_attendances) }
        it { should have_many(:attended_events).through(:event_attendances) }
    end





end