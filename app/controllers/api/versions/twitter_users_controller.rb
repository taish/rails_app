require 'rss'

module Api::Versions
  class TwitterUsersController < ApiController

    # doorkeeper_for :all
    before_action :set_twitter_user, only: [:show, :update, :destroy]
      # :id_pass_update, :id_pass_destroy, :create_tweet_list, :register_word, :tweet, :follow, :try_search]

    def index
      # specific_assigned_version_process(__callee__, params)
      @twitter_users = current_user.twitter_users.all
    end

    def show
      # specific_assigned_version_process(__callee__, params)
    end

    def create
      # specific_assigned_version_process(__callee__, params)
      @twitter_user = current_user.twitter_users.create!(twitter_user_params)
      render action: 'show', status: :created
    end

    def update
      # specific_assigned_version_process(__callee__, params)
      @twitter_user.update!(twitter_user_params)
      head :no_content
    end

    def destroy
      # specific_assigned_version_process(__callee__, params)
      @twitter_user.destroy!
      head :no_content
    end

  # def id_pass_update
  #   @twitter_user.update(twitter_id: :true)
  #   respond_to do |format|
  #     format.html { redirect_to @twitter_user }
  #   end
  # end
  #
  # def id_pass_destroy
  #   @twitter_user.update(twitter_id: nil, twitter_pass: nil)
  #   respond_to do |format|
  #     format.html { redirect_to @twitter_user }
  #   end
  # end
  #
  # def try_search
  #   twitter = Api::Service::Twitter.new(@twitter_user.access_token, @twitter_user.access_token_secret)
  #   twitter.user_list(twitter_user_params[:word]).each do |user|
  #   binding.pry
  #     unless user[:following]
  #       @twitter_user.search_users.create(
  #         name: user[:name],
  #         screen_name: user[:screen_name],
  #         description: user[:description],
  #         profile_image_url: user[:profile_image_url],
  #         friends_count: user[:friends_count],
  #         followers_count: user[:followers_count],
  #       )
  #     end
  #   end
  #   respond_to do |format|
  #     format.html { redirect_to follow_twitter_user_path }
  #   end
  # end
  #
  # def register_word
  #   search_word = @twitter_user.search_words.build(twitter_user_params)
  #   respond_to do |format|
  #     if search_word.save
  #       format.html { redirect_to follow_twitter_user_path }
  #       format.json { render action: 'show', status: :created, location: @twitter_user }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @twitter_user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_user
      @twitter_user = current_user.twitter_users.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_user_params
      params.require(:twitter_user).permit(:uid, :screen_name, :provider, :profile_image_url, :friends_count, :follewers_count)
    end
  end
end
