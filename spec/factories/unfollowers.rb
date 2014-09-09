# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unfollower do
    uid 1
    twitter_user_id 1
    following false
  end
end
