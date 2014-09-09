# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :twitter_user do
    friend_count 1
    follewer_count 1
    access_token "MyString"
    access_token_secret "MyString"
    uid "MyString"
    screen_name "MyString"
    provider "MyString"
  end
end
