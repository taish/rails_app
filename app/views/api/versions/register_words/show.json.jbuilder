json.extract! @register_word, :id, :word, :type, :created_at, :updated_at
json.twitter_user do
  json.id @register_word.twitter_user_id
end
json.status @status
json.message @message
