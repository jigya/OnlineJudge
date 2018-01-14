class Participant < ActiveRecord::Base
  belongs_to :contest
  belongs_to :user
  validates :contest_id, presence: true, uniqueness: {scope: :user_id, message: "You have already registered"}
end
