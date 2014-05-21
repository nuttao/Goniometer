json.array!(@measures) do |measure|
  json.extract! measure, :id, :user_id, :measure_mode, :patient_id, :description, :measured_at, :body_part_id, :motion_id
  json.url measure_url(measure, format: :json)
end
