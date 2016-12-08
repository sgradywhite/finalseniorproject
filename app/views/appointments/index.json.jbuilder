json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :users_id, :date, :firstname, :lastname, :specialty, :status
  json.url appointment_url(appointment, format: :json)
end
