require 'spec_helper'

describe "twitter_users/index" do
  before(:each) do
    assign(:twitter_users, [
      stub_model(TwitterUser,
        :friend_count => 1,
        :follewer_count => 2,
        :access_token => "Access Token",
        :access_token_secret => "Access Token Secret",
        :uid => "Uid",
        :screen_name => "Screen Name",
        :provider => "Provider"
      ),
      stub_model(TwitterUser,
        :friend_count => 1,
        :follewer_count => 2,
        :access_token => "Access Token",
        :access_token_secret => "Access Token Secret",
        :uid => "Uid",
        :screen_name => "Screen Name",
        :provider => "Provider"
      )
    ])
  end

  it "renders a list of twitter_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Access Token".to_s, :count => 2
    assert_select "tr>td", :text => "Access Token Secret".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
  end
end
