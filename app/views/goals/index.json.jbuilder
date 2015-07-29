json.array!(@goals) do |goal|
  json.extract! goal, :id, :title, :description, :start_date, :user_id
  json.url goal_url(goal, format: :json)
end
