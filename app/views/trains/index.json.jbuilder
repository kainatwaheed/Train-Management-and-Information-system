json.array!(@trains) do |train|
  json.extract! train, :id, :name, :noofseats, :noofclasses
  json.url train_url(train, format: :json)
end
