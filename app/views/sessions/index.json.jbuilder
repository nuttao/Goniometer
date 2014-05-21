json.array!(@sessions) do |session|
  json.extract! session, :id, :user_id, :client_uid, :token
  json.url session_url(session, format: :json)
end
