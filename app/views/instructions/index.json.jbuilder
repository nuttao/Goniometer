json.array!(@instructions) do |instruction|
  json.extract! instruction, :id, :motion_id, :description, :axis_mode, :order_no
  json.url instruction_url(instruction, format: :json)
end
