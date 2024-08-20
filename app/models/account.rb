class Account < ApplicationRecord
  has_many :playlist

  validates :username, 
    presence: true

  def authenticate(account_params)
    username_query = account_params[:username]
    password_query = account_params[:password]
    Account.exists?(:username => username_query, :password => password_query)
  end

end
