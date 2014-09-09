json.extract! @tweet, :id, :search_word, :hatebu_count, :title, :url, :created_at, :updated_at
json.twitter_user do
  json.id @tweet.twitter_user_id
end
json.status @status
json.message @message
