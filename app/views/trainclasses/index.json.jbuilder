json.array!(@trainclasses) do |trainclass|
  json.extract! trainclass, :id, :name, :train_id, :totalseats, :fare
  json.url trainclass_url(trainclass, format: :json)
end
