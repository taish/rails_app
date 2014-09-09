module Api
  module Service
    class Twitter

      def initialize(access_token, access_token_secret)
        @api_client = ::Api::ApiClient::Twitter.new(access_token, access_token_secret)
      end

      def user_list(search_word)
        search_result = @api_client.search(search_word)
        create_user_list(search_result)
      end

      private

      def create_user_list(search_result)
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
