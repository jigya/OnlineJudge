json.array!(@problem_in_contests) do |problem_in_contest|
  json.extract! problem_in_contest, :id, :problem_id, :contest_id
  json.url problem_in_contest_url(problem_in_contest, format: :json)
end
