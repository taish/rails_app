json.array!(@twitter_users) do |twitter_user|
  json.extract! twitter_user, :id, :uid, :screen_name, :provider, :profile_image_url, :friends_count, :followers_count, :created_at, :updated_at
  json.friends do |user|
    json.array!(twitter_user.friends) do |friend|
      json.extract! friend, :id, :uid, :name, :screen_name, :description, :profile_image_url, :friends_count, :followers_count, :following, :created_at, :updated_at
      json.twitter_user do |no_using1|
        json.id twitter_user.user_id
        json.screen_name twitter_user.screen_name
      end
    end
  end
  json.tweets do |tweet|
    json.array!(twitter_user.tweets) do |tweet|
      json.extract! tweet, :id, :search_word, :hatebu_count, :title, :url, :created_at, :updated_at
      json.twitter_user do |no_using2|
        json.id twitter_user.user_id
        json.screen_name twitter_user.screen_name
      end
    end
  end
end
