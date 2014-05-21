json.array!(@motions) do |motion|
  json.extract! motion, :id, :body_part_id, :name
  json.url motion_url(motion, format: :json)
end
