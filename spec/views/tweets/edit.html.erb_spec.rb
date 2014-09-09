require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :search_word => "MyString",
      :hatebu_count => 1,
      :title => "MyString",
      :url => "MyString",
      :twitter_user_id => 1
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tweet_path(@tweet), "post" do
      assert_select "input#tweet_search_word[name=?]", "tweet[search_word]"
      assert_select "input#tweet_hatebu_count[name=?]", "tweet[hatebu_count]"
      assert_select "input#tweet_title[name=?]", "tweet[title]"
      assert_select "input#tweet_url[name=?]", "tweet[url]"
      assert_select "input#tweet_twitter_user_id[name=?]", "tweet[twitter_user_id]"
    end
  end
end
