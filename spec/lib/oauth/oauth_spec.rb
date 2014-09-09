require 'spec_helper'
require 'oauth2'
require 'pry'

describe Api::ApiController do
  before(:all) do
  end

  describe "new" do
    @client_id     = Rails.application.secrets.rails_app_id # your client's id generated with rake db:setup
    @client_secret = Rails.application.secrets.rails_app_secret # your client's secret
    @redirect_uri  = 'urn:ietf:wg:oauth:2.0:oob' # your client's redirect uri
    @site          = 'http://localhost:3000' # your provider server, mine is running on localhost

    @client        = OAuth2::Client.new(@client_id, @client_secret, :site => @site)
    @client.auth_code.authorize_url(redirect_uri: @redirect_uri, email: "", password: "")
    code = "bc806cfc0d5633395eb88893ab71fc57185d4febefc8f2cbe04eb32d5f497d97"
    token = @client.auth_code.get_token(code, redirect_uri: @redirect_uri)

    it "hoge" do
    end
  end
end
