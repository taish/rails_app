json.array!(@hatebus) do |hatebu|
  json.extract! hatebu, :id, :title, :url
  json.twitter_user do
    json.id hatebu.twitter_user_id
  end
  json.register_word do
    json.id hatebu.register_word_id
  end
end
json.status @status
json.message @message
