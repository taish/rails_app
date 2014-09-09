module Concerns::ErrorHandlers
  extend ActiveSupport::Concern

  attr_accessor :status, :message

  included do
    before_filter :setup
    rescue_from StandardError, with: :rescue_error
  end

  private

  def rescue_error(e)
    binding.pry
    @message = e.message
    if rescuable?(e)
      ex = e.is_a?(Exceptions::BaseException) ? e : RESCUE_ERROR[e.to_s.to_sym]
      @status = ex.status
    else
      @status = 500
      @message = e.message
    end

    render json: @message, status: @status
  end

  def rescuable?(e)
    return e.is_a?(Exceptions::BaseException) || RESCUE_ERROR.has_key?(e.to_s.to_sym)
  end

  def setup
    @message = "OK"
    @status = 200
  end

  RESCUE_ERROR = {
    ActiveRecord::RecordNotFound.to_s.to_sym => Exceptions::BaseException.new(404, "Record Not Found"),
    ActiveRecord::RecordInvalid.to_s.to_sym => Exceptions::BaseException.new(404, "Record Not Invalid")
  }
end