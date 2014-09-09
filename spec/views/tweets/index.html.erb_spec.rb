require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :search_word => "Search Word",
        :hatebu_count => 1,
        :title => "Title",
        :url => "Url",
        :twitter_user_id => 2
      ),
      stub_model(Tweet,
        :search_word => "Search Word",
        :hatebu_count => 1,
        :title => "Title",
        :url => "Url",
        :twitter_user_id => 2
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Search Word".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
