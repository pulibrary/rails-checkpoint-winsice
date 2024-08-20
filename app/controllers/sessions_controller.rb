class SessionsController < ApplicationController

  # Makes a new user session for correct credentials on login 
  def create
    credentials = account_params
    account = Account.find_by_username(credentials[:username])
    if account && account.authenticate(credentials)
      session[:account_id] = account.id
      redirect_to '/'
    end
  end

  # Resets user session for logout
  def destroy
    session[:account_id] = nil
    redirect_to '/login'
  end

  private
    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:username, :password)
    end
end
