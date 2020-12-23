# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participant, type: :model do
  context 'participant creation' do
    it 'invalid participant if name is blank' do
      participant = build(:participant, name: '')

      expect(participant.valid?).to eq false
      # expect(participant.errors.messages[:name]).to eq(["can't be blank"])
    end

    it 'does not create a participant if age is blank' do
      participant = build(:participant, age: '')

      expect(participant.valid?).to eq false    
    end
    
    it 'does not create a participant if gender is blank' do
      participant = build(:participant, gender: '')

      expect(participant.valid?).to eq false    
    end

    it 'does not create a participant if gender is not male/female' do
      participant = build(:participant, gender: 'will_not_provide_one')

      expect(participant.valid?).to eq false    
    end

    it 'doest not create participant with same name' do
      create(:participant, name: 'Sagar')
      participant = build(:participant, name: 'sagar')

      expect(participant.valid?).to eq false
    end
  end
end
