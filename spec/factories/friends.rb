# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    uid 1
    name "MyString"
    screen_name "MyString"
    description "MyString"
    profile_image_url "MyString"
    friends_count 1
    followers_count 1
    twitter_user_id 1
    following false
  end
end
