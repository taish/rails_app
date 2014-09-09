json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :search_word, :hatebu_count, :title, :url
  json.twitter_user do
    json.id tweet.twitter_user_id
  end
end
json.status @status
json.message @message
