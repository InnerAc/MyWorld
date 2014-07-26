json.array!(@avatars) do |avatar|
  json.extract! avatar, :id, :image_path
  json.url avatar_url(avatar, format: :json)
end
