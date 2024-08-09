# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private
  
    def current_account
      Account.where(id: session[:account_id]).first
    end
      
    helper_method :current_account

end
