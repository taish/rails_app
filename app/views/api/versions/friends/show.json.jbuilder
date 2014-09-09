json.extract! @friend, :id, :uid, :name, :screen_name, :description, :profile_image_url, :friends_count, :followers_count,  :following, :created_at, :updated_at
json.twitter_user do
  json.id @friend.twitter_user_id
end
json.status @status
json.message @message
