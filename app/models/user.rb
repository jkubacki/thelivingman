class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  validates_length_of :name, minimum: 3, maximum: 50, allow_blank: false
  has_many :characters
  has_many :campaigns, through: :characters
end
