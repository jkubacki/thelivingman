require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  describe 'has name' do
    it 'not empty' do
      campaign = FactoryGirl.build(:campaign)
      campaign.name = ''
      expect(campaign).to_not be_valid
      expect(campaign.errors[:name]).to include("can't be blank")
    end
    it 'not nil' do
      campaign = FactoryGirl.build(:campaign)
      campaign.name = nil
      expect(campaign).to_not be_valid
      expect(campaign.errors[:name]).to include("can't be blank")
    end
    it 'no shorter than 3 characters' do
      campaign = FactoryGirl.build(:campaign)
      campaign.name = 'Mi'
      expect(campaign).to_not be_valid
      expect(campaign.errors[:name]).to include('is too short (minimum is 3 characters)')
    end
  end
  it 'has user' do
    campaign = FactoryGirl.build(:campaign)
    campaign.user = nil
    expect(campaign).to_not be_valid
    expect(campaign.errors[:user]).to include("can't be blank")
  end
  it 'can call user by method game_master' do
    campaign = FactoryGirl.build(:campaign)
    expect(campaign).to respond_to('game_master')
    expect(campaign.game_master).to eq(campaign.user)
  end
  describe 'has many characters' do
    it 'accessed by method characters' do
      campaign = FactoryGirl.build(:campaign)
      expect(campaign).to respond_to('characters')
    end
  end

  it 'is not ready to start without characters' do
    campaign = FactoryGirl.build(:campaign)
    campaign.characters = []
    expect(campaign.ready_to_start?).to be_falsey
  end

  describe 'has many users' do
    it 'accessed by method users' do
      campaign = FactoryGirl.build(:campaign)
      expect(campaign).to respond_to('users')
    end
    it 'through characters' do
      character = FactoryGirl.create(:character)
      campaign = character.campaign
      user = FactoryGirl.create(:user)
      user.characters << character
      expect(campaign.users).to include(user)
    end
  end
end
