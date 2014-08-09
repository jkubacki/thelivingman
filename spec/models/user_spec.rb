require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'has name' do
    it 'not empty' do
      user = FactoryGirl.build(:user)
      user.name = ''
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
    it 'not nil' do
      user = FactoryGirl.build(:user)
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
    it 'no shorter than 3 characters' do
      user = FactoryGirl.build(:user)
      user.name = 'Mi'
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include('is too short (minimum is 3 characters)')
    end
    it 'no longer than 50 characters' do
      user = FactoryGirl.build(:user)
      user.name = '123456789012345678901234567890123456789012345678901234567890' # length 60
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include('is too long (maximum is 50 characters)')
    end
  end
  describe 'has many characters' do
    it 'accessed by method characters' do
      user = FactoryGirl.build(:user)
      expect(user).to respond_to('characters')
    end
    it 'of class Character' do
      user = FactoryGirl.build(:user)
      user.characters << FactoryGirl.build(:character)
      expect(user.characters[0]).to be_kind_of(Character)
    end
  end
  describe 'has many campaigns' do
    it 'accessed by method campaigns' do
      user = FactoryGirl.build(:user)
      expect(user).to respond_to('campaigns')
    end
    it 'through characters' do
      character = FactoryGirl.create(:character)
      user = character.user
      campaign = FactoryGirl.create(:campaign)
      campaign.characters << character
      expect(user.campaigns).to include(campaign)
    end
  end
end