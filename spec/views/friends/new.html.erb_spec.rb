require 'spec_helper'

describe "friends/new" do
  before(:each) do
    assign(:friend, stub_model(Friend,
      :uid => 1,
      :name => "MyString",
      :screen_name => "MyString",
      :description => "MyString",
      :profile_image_url => "MyString",
      :friends_count => 1,
      :followers_count => 1,
      :twitter_user_id => 1,
      :following => false
    ).as_new_record)
  end

  it "renders new friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friends_path, "post" do
      assert_select "input#friend_uid[name=?]", "friend[uid]"
      assert_select "input#friend_name[name=?]", "friend[name]"
      assert_select "input#friend_screen_name[name=?]", "friend[screen_name]"
      assert_select "input#friend_description[name=?]", "friend[description]"
      assert_select "input#friend_profile_image_url[name=?]", "friend[profile_image_url]"
      assert_select "input#friend_friends_count[name=?]", "friend[friends_count]"
      assert_select "input#friend_followers_count[name=?]", "friend[followers_count]"
      assert_select "input#friend_twitter_user_id[name=?]", "friend[twitter_user_id]"
      assert_select "input#friend_following[name=?]", "friend[following]"
    end
  end
end
