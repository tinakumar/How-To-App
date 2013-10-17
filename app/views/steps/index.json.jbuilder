json.array!(@steps) do |step|
  json.extract! step, :description, :list_id
  json.url step_url(step, format: :json)
end
