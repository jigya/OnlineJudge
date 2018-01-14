class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  
  has_many :participants
  has_many :contests
  has_many :contests, through: :participants
  has_many :submissions
  has_many :problems
  has_many :problems, through: :submissions
  end
