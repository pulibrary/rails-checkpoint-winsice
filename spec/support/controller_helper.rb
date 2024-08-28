module ControllerHelper
  def login(account)
    session[:account_id] = account.id
  end 
end 