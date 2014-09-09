class ApiClient::Twitter::Search::BuildService < BaseService

  def initialize(args={})
    @params = args[:params]
    @twitter_user = args[:twitter_user]
    @register_word = args[:register_word]
    arg_valid?
    @api_client = ::Api::ApiClient::Twitter.new(@twitter_user.access_token, @twitter_user.access_token_secret)
  end

  def run
    form.valid? && build
  en

  def build
    api_client
    params_array = @api_client.search(@register_word.word, count: 10)
    params_array.reduce([]) do |array, params|
      friend = Friend.new(params)
      friend.register_word = @register_word
      friend.twitter_user = @twitter_user
      array << friend
    end
  end

  private

    def form
      Api::Versions::Friends::FriendsCandidateForm.new(@params)
    end

    def arg_valid?
      [@params, @twitter_user, @register_word].each { |d| raise LackOfArgsError if d.nil? }
    end
end
