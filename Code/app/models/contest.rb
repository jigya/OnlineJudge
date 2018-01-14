class Contest < ActiveRecord::Base
  belongs_to :user
  has_many :participants
  has_many :users, through: :participants
  has_many :problem_in_contests
  has_many :problem, through: :problem_in_contests
  validates :contestName, presence: true, uniqueness: {scope: :startDateTime, message: "Another contest of same name exists"}
  validates :startDateTime, presence: true
  validates :endDateTime, presence: true
  validate :startDateTime_cannot_be_in_past, :endDateTime_cannot_be_less_than_startDateTime

  def startDateTime_cannot_be_in_past
  	if(startDateTime<DateTime.now)
  		errors.add(:startDateTime, "can't be in the past")
  	end
  end

  def endDateTime_cannot_be_less_than_startDateTime
  		if(startDateTime>endDateTime)
  			errors.add(:endDateTime,"can't be less than start date time")
  		end
  end
end
