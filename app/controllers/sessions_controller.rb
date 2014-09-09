# deal with cookie
class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid."
    end
  end

  def destroy
    logout
    redirect_to register_path, :notice => "Logged out!"
  end
  # previous code
  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     sign_in user
  #     redirect_to users_path
  #   else
  #     flash[:error] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end

  # def destroy
  #   sign_out
  #   redirect_to root_url
  # end

  def callback
    #IXmasJuIVewcj2X98AXSBeAJNVMSsxnA7qh5Wd3FQ
    auth = request.env['omniauth.auth']
    TwitterUser.find_by_provider_and_uid(auth['provider'], auth['uid']) ||
      TwitterUser.create_with_omniauth(auth, current_user)
    redirect_to ('/index.html')
  end

  # def twit_destroy
  #   reset_session
  #   redirect_to root_path
  # end
end
