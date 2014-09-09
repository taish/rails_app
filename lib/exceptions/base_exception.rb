module Exceptions
  class BaseException < ::StandardError
    attr_accessor :status

    def initialize(status = 500, message = "Error")
      super(message)
      @status = status
    end
  end
end