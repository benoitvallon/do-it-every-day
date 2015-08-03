json.array!(@activities) do |activity|
  json.extract! activity, :id, :due_date, :done, :progress, :note
  json.url activity_url(activity, format: :json)
end
