# base controller inherited by all api controllers
class Api::ApiController < ApplicationController
  respond_to :json
  before_action :validate_format, :validate_current_user
  skip_before_filter :verify_authenticity_token
  include ::Concerns::ErrorHandlers


  private

    def validate_current_user
      return head(401) unless current_user
    end

    def validate_twitter_user
      if params[:twitter_user_id].to_i.in?(current_user.twitter_users.pluck(:id))
        current_twitter_user
      else
        return head(401)
      end
    end

    def current_twitter_user
      @current_twitter_user ||= current_user.twitter_users.find(params[:twitter_user_id])
    end

    def validate_format
      render nothing: true, status: :not_acceptable unless params[:format] == 'json'
    end
end
