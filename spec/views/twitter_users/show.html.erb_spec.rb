require 'spec_helper'

describe "twitter_users/show" do
  before(:each) do
    @twitter_user = assign(:twitter_user, stub_model(TwitterUser,
      :friend_count => 1,
      :follewer_count => 2,
      :access_token => "Access Token",
      :access_token_secret => "Access Token Secret",
      :uid => "Uid",
      :screen_name => "Screen Name",
      :provider => "Provider"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Access Token/)
    rendered.should match(/Access Token Secret/)
    rendered.should match(/Uid/)
    rendered.should match(/Screen Name/)
    rendered.should match(/Provider/)
  end
end
