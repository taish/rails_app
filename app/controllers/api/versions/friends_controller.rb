module Api::Versions
  class FriendsController < ApiController
    # Need :twitter_user_id
    before_action :validate_twitter_user
    before_action :set_friend, only: [:show, :update, :destroy]
    before_action :set_register_word, only: [:create, :friends_candidate]

    def index
      # specific_assigned_version_process(__callee__, params)
      @friends = current_twitter_user.friends.all
    end

    def show
      # specific_assigned_version_process(__callee__, params)
    end

    def create
      # specific_assigned_version_process(__callee__, params)
      if @friend = ::Friends::CreateService.execute({ params: friend_params, twitter_user: current_twitter_user, register_word: @register_word})
        render action: 'show', status: :created
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end

    def update
      # specific_assigned_version_process(__callee__, params)
      if @friend.update(friend_params)
        render action: 'show', status: :ok
      else
        render json: @friend.errors, status: :unprocessable_entity
      end
    end

    def destroy
      # specific_assigned_version_process(__callee__, params)
      if @friend.destroy
        render action: 'show', status: :ok
      else
        render json: @tweet.errors, status: :unprocessable_entity
      end
    end

    def friends_candidate
      if @friends = ::ApiClient::Twitter::Search::BuildService.execute({params: params, twitter_user: current_twitter_user, register_word: @register_word})
        render action: 'index', status: :ok
      else
        render json: @friends.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_friend
        @friend = current_twitter_user.friends.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def friend_params
        params.require(:friend).permit(:uid, :name, :screen_name, :description, :profile_image_url, :friends_count, :followers_count, :twitter_user_id, :following)
      end

      def set_register_word
        @register_word = current_twitter_user.register_words.find(params[:register_word_id])
      end
  end
end
