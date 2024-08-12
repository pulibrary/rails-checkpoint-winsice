# frozen_string_literal: true

class ApplicationController < ActionController::Base

  private

    # Returns the Account ID of the user
    def current_account
      Account.where(id: session[:account_id]).first
    end

    helper_method :current_account

end
