class Account < ApplicationRecord
  has_many :playlist

  validates :username, 
    presence: true

  def authenticate(username, password)
    username_query = username
    password_query = password
    Account.exists?(:username => username_query, :password => password_query)
  end

end
