json.array!(@problems) do |problem|
  json.extract! problem, :id, :title, :timeLimit, :sourceLimit, :dateAdded, :problemStatement, :solutionFile, :testFile
  json.url problem_url(problem, format: :json)
end
