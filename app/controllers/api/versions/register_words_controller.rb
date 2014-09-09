#  Need tweet_id or friend_id
module Api::Versions
  class RegisterWordsController < ApiController
    # Need :twitter_user_id
    before_action :validate_twitter_user
    before_action :set_register_word, only: [:show, :destroy]

    def index
      # とりあえず親クラス宣言せなエラーでる...
      # RegisterWord
      # specific_assigned_version_process(__callee__, params)
      @register_words = create_type.constantize.where(twitter_user_id: current_twitter_user.id)
    end

    def show
      # specific_assigned_version_process(__callee__, params)
    end

    def create
      # specific_assigned_version_process(__callee__, params)
      @register_word = current_twitter_user.register_words.create!(word: params[:word], type: create_type)
      render action: 'show', status: :created
    end

    def destroy
      # specific_assigned_version_process(__callee__, params)
      @register_word.destroy!
      render action: 'show', status: :ok
    end

    private

      def set_register_word
        @register_word = current_twitter_user.register_words.find(params[:id])
      end

      def register_word_params
        params.require(:register_word).permit(:word)
      end

      def create_type
        if params[:tweet_type]
          'TweetWord'
        elsif params[:friend_type]
          'FriendWord'
        end
      end
  end
end
