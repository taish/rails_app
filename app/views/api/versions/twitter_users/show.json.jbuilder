json.extract! @twitter_user, :id, :friend_count, :follewer_count, :access_token, :access_token_secret, :uid, :screen_name, :provider, :created_at, :updated_at
json.status @status
json.message @message
