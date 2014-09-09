require 'spec_helper'

describe "twitter_users/edit" do
  before(:each) do
    @twitter_user = assign(:twitter_user, stub_model(TwitterUser,
      :friend_count => 1,
      :follewer_count => 1,
      :access_token => "MyString",
      :access_token_secret => "MyString",
      :uid => "MyString",
      :screen_name => "MyString",
      :provider => "MyString"
    ))
  end

  it "renders the edit twitter_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", twitter_user_path(@twitter_user), "post" do
      assert_select "input#twitter_user_friend_count[name=?]", "twitter_user[friend_count]"
      assert_select "input#twitter_user_follewer_count[name=?]", "twitter_user[follewer_count]"
      assert_select "input#twitter_user_access_token[name=?]", "twitter_user[access_token]"
      assert_select "input#twitter_user_access_token_secret[name=?]", "twitter_user[access_token_secret]"
      assert_select "input#twitter_user_uid[name=?]", "twitter_user[uid]"
      assert_select "input#twitter_user_screen_name[name=?]", "twitter_user[screen_name]"
      assert_select "input#twitter_user_provider[name=?]", "twitter_user[provider]"
    end
  end
end
