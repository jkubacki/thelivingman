class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  validates_presence_of :name
end
