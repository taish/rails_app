json.array!(@twitter_users) do |twitter_user|
  json.extract! twitter_user, :id, :uid, :screen_name, :provider, :profile_image_url, :friends_count, :followers_count, :created_at, :updated_at
  json.user do
    json.id twitter_user.user_id
  end
end
json.status @status
json.message @message
