require 'spec_helper'

describe Api::ApiClient::Twitter do

  before do
    @api_client = Api::ApiClient::Twitter.new(
      # deleted
      "",
      ""
    )
  end

  describe "search" do
    before do
      @api_client.unfollow("take")
    end

    it "returns http success" do
    end
  end

  describe "friend" do
    before do
      @api_client.follower_ids
    end

    it "returns http success" do
    end
  end
end
