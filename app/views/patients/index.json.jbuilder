json.array!(@patients) do |patient|
  json.extract! patient, :id, :name, :gender, :age, :user_id
  json.url patient_url(patient, format: :json)
end
