json.array!(@solutions) do |solution|
  json.extract! solution, :id, :issue_id, :description
  json.url solution_url(solution, format: :json)
end
