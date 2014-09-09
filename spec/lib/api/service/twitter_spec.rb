require 'spec_helper'

describe Api::Service::Twitter do

  before do
    @service = Api::Service::Twitter.new(
      "",
      ""
    )
  end

  describe 'user_list' do
    before do
      @user_list = @service.user_list('Rails')
    end

    it "created list" do
      expect(@user_list.class).to eq(Array)
    end
  end
end
