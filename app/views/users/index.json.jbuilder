json.array!(@users) do |user|
  json.extract! user, :id, :username, :crypted_password, :email, :role_id
  json.url user_url(user, format: :json)
end
