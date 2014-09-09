class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def not_authenticated
      redirect_to register_path, :alert => "First log in to view ↵
      this page."
    end
end
