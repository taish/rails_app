# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :register_word do
    word "MyString"
    registrable_id 1
    registrable_type "MyString"
  end
end
