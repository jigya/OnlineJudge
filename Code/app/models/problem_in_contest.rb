class ProblemInContest < ActiveRecord::Base
  belongs_to :problem
  belongs_to :contest
  validates :problem_id, uniqueness: {scope: :contest_id, message:"Problem is already added to contest" }
end
