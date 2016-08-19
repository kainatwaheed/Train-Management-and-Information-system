json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :user_id, :trainroute_id, :seats
  json.url reservation_url(reservation, format: :json)
end
