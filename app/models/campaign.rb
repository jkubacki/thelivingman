class Campaign < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :user
  validates_length_of :name, minimum: 3, allow_blank: false
  has_many :characters
  has_many :users, through: :characters

  alias_method :game_master, :user

  def ready_to_start?
    if characters.empty? then false else true end
  end
end
