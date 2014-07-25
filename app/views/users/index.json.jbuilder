json.array!(@users) do |user|
  json.extract! user, :id, :name, :pwd, :is_admin
  json.url user_url(user, format: :json)
end
