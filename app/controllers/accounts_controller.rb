class AccountsController < ApplicationController

  # GET /login
  def login
  end

  # GET /createaccount
  def new
    @account = Account.new
  end

  # POST /createaccount
  def create
    @account = Account.new(account_params)
    @account.save
    session[:account_id] = @account.id
  end

  private
    # Only allow a list of trusted parameters through.
    def account_params
      params.permit(:username, :password)
    end
end
