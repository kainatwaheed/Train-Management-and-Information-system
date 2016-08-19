json.array!(@seats) do |seat|
  json.extract! seat, :id, :deptdate, :tname, :seat1, :seat2, :seat3, :trainroute_id
  json.url seat_url(seat, format: :json)
end
