# Tweet and register_word Controller
module Api::Versions
  class TweetsController < ApiController
    # Need :twitter_user_id
    before_action :validate_twitter_user
    before_action :set_tweet, only: [:show, :destroy]
    before_action :set_tweets, only: [:destroy_done]
    before_action :set_register_word, only: [:create, :build_hatebus]

    def index
      # specific_assigned_version_process(__callee__, params)
      @tweets = current_twitter_user.tweets.all
    end

    def show
      # specific_assigned_version_process(__callee__, params)
    end

    # Need register_word_id
    def create
      # specific_assigned_version_process(__callee__, params)
      @tweet = Tweets::CreateService.execute(params, {twitter_user: current_twitter_user, register_word: @register_word})
      render action: 'show', status: :created
    end

    def destroy
      # specific_assigned_version_process(__callee__, params)
      @tweet.destroy!
      render action: 'show', status: :ok
    end

    def build_hatebus
      # specific_assigned_version_process(__callee__, params)
      @hatebus = Tweets::BuildHatebusService.execute({twitter_user: current_twitter_user, register_word: @register_word})
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tweet
        @tweet = current_twitter_user.tweets.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def tweet_params
        params.require(:tweet).permit(:search_word, :hatebu_count, :title, :url)
      end

      def set_register_word
        @register_word = current_twitter_user.register_words.find(params[:register_word_id])
      end
  end
end
