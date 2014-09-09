require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :search_word => "Search Word",
      :hatebu_count => 1,
      :title => "Title",
      :url => "Url",
      :twitter_user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Search Word/)
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/2/)
  end
end
