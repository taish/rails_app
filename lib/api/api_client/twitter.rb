module Api
  module ApiClient
    class Twitter

      def initialize(access_token, access_token_secret)
        @token  = access_token
        @secret = access_token_secret
        client
      end

      def client
        @client ||= ::Twitter::REST::Client.new do |config|
          config.consumer_key        = Rails.application.secrets.api_key
          config.consumer_secret     = Rails.application.secrets.api_secret
          config.access_token        = @token
          config.access_token_secret = @secret
        end
      end

      def follow(uid)
        client.follow(uid)
      end

      def unfollow(uid)
        client.unfollow(uid)
      end

      def tweet(word)
        client.update(word)
      end

      # @option options [String] :result_type Specifies what type of search results you would prefer to receive. Options are "mixed", "recent", and "popular". The current default is "mixed."
      def search(word, count: 1, result_type: "recent")
        search_result = client.search("#{word}", count: count, result_type: result_type)
        create_search_params_array(search_result)
      end

      def follower_ids
        client.follower_ids.to_a
      end

      def friend_ids
        client.friend_ids.to_a
      end

      private

        def create_search_params_array(search_result)
          search_result.attrs[:statuses].each_with_object([]) do |result, array|
            array <<  {
              name: result[:user][:name],
              screen_name: result[:user][:screen_name],
              description: result[:user][:description],
              followers_count: result[:user][:followers_count],
              friends_count: result[:user][:friends_count],
              profile_image_url: result[:user][:profile_image_url],
              following: result[:user][:following]
            }
          end
        end

    end
  end
end
