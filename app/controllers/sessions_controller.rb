class SessionsController < ApplicationController

  # Makes a new user session for correct credentials on login 
  def create
    account = Account.find_by_username(params[:username])
    if account && account.authenticate(params[:username], params[:password])
      session[:account_id] = account.id
      redirect_to '/'
    end
  end

  # Resets user session for logout
  def destroy
    session[:account_id] = nil
    redirect_to '/login'
  end

end
