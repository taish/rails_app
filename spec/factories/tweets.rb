# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    search_word "MyString"
    hatebu_count 1
    title "MyString"
    url "MyString"
    twitter_user_id 1
  end
end
