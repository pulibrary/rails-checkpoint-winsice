class AccountsController < ApplicationController

  # GET /login
  def login
    @account = Account.new
    @post_url = '/login'
    @button_label = 'Log In'
  end

  # GET /createaccount
  def new
    @account = Account.new
    @post_url = '/createaccount'
    @button_label = 'Create Account'
  end

  # POST /createaccount
  def create
    @account = Account.new(account_params)
    @account.save
    session[:account_id] = @account.id
    redirect_to '/'
  end

  private
    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:username, :password)
    end

end
