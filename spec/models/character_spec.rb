require 'rails_helper'

RSpec.describe Character, :type => :model do
  describe 'has name' do
    it 'not empty' do
      character = FactoryGirl.build(:character)
      character.name = ''
      expect(character).to_not be_valid
      expect(character.errors[:name]).to include("can't be blank")
    end
    it 'not nil' do
      character = FactoryGirl.build(:character)
      character.name = nil
      expect(character).to_not be_valid
      expect(character.errors[:name]).to include("can't be blank")
    end
  end

end
