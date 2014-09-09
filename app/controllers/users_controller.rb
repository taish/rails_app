class UsersController < ApplicationController
  respond_to :json
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to ('/index.html')
    else
      redirect_to register_path, notice: 'invalid'
    end
  end

  private

    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation)
    end
end
