json.array!(@contests) do |contest|
  json.extract! contest, :id, :contestName, :startDateTime, :endDateTime, :contestStatus, :user_id
  json.url contest_url(contest, format: :json)
end
