json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :hours, :minutes, :approved, :user_id
  json.url appointment_url(appointment, format: :json)
end
