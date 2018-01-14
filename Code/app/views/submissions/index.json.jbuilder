json.array!(@submissions) do |submission|
  json.extract! submission, :id, :languageUsed, :dateTimeOfSubmission, :timeTaken, :memoryUsed, :submissionFile, :status, :user_id, :problem_id, :contest_id
  json.url submission_url(submission, format: :json)
end
