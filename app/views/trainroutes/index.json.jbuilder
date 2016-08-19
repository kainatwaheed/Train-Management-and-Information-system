json.array!(@trainroutes) do |trainroute|
  json.extract! trainroute, :id, :train_id, :source, :destination, :deptdate, :arrivaldate, :deptime, :arrivaltime
  json.url trainroute_url(trainroute, format: :json)
end
