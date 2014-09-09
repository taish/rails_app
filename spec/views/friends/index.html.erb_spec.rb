require 'spec_helper'

describe "friends/index" do
  before(:each) do
    assign(:friends, [
      stub_model(Friend,
        :uid => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :description => "Description",
        :profile_image_url => "Profile Image Url",
        :friends_count => 2,
        :followers_count => 3,
        :twitter_user_id => 4,
        :following => false
      ),
      stub_model(Friend,
        :uid => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :description => "Description",
        :profile_image_url => "Profile Image Url",
        :friends_count => 2,
        :followers_count => 3,
        :twitter_user_id => 4,
        :following => false
      )
    ])
  end

  it "renders a list of friends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
