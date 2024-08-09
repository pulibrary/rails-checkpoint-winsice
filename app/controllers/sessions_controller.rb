class SessionsController < ApplicationController
  def new
  end

  def create
    account = Account.find_by_username(params[:username])

    if account && account.authenticate(params[:username], params[:password])
      session[:account_id] = account.id
      redirect_to '/', notice: 'Logged in!'
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to '/', notice: 'Logged out!'
  end

end
