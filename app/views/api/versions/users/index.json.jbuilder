json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :search_word, :hatebu_count, :title, :url, :twitter_user_id
  json.url tweet_url(tweet, format: :json)
end
json.status @status
json.message @message
