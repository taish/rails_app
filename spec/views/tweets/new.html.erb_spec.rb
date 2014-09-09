require 'spec_helper'

describe "tweets/new" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :search_word => "MyString",
      :hatebu_count => 1,
      :title => "MyString",
      :url => "MyString",
      :twitter_user_id => 1
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweets_path, "post" do
      assert_select "input#tweet_search_word[name=?]", "tweet[search_word]"
      assert_select "input#tweet_hatebu_count[name=?]", "tweet[hatebu_count]"
      assert_select "input#tweet_title[name=?]", "tweet[title]"
      assert_select "input#tweet_url[name=?]", "tweet[url]"
      assert_select "input#tweet_twitter_user_id[name=?]", "tweet[twitter_user_id]"
    end
  end
end
