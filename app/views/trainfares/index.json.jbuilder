json.array!(@trainfares) do |trainfare|
  json.extract! trainfare, :id, :train_id, :source, :destination, :fare1, :fare2, :fare3
  json.url trainfare_url(trainfare, format: :json)
end
