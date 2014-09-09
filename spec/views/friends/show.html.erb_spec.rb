require 'spec_helper'

describe "friends/show" do
  before(:each) do
    @friend = assign(:friend, stub_model(Friend,
      :uid => 1,
      :name => "Name",
      :screen_name => "Screen Name",
      :description => "Description",
      :profile_image_url => "Profile Image Url",
      :friends_count => 2,
      :followers_count => 3,
      :twitter_user_id => 4,
      :following => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Screen Name/)
    rendered.should match(/Description/)
    rendered.should match(/Profile Image Url/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/false/)
  end
end
