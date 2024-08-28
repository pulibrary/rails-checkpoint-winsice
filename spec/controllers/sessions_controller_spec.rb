require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:correct_credentials) do 
    {
      username: "testAccount",
      password: "testPassword"
    }
  end 

  let(:wrong_credentials) do 
    {
      username: "wrongAccount",
      password: "wrongPassword"
    }
  end 

  describe "create session" do
    it "logs in successfully and redirects to / page" do
      post :create, params: { account: correct_credentials }
      expect(session[:account_id]).to be_truthy
      expect(response).to redirect_to("/")
    end 

    it "fails to log in with incorrect credentials and redirects to /login page" do
      post :create, params: { account: wrong_credentials }
      expect(session[:account_id]).to be_falsey
      expect(response).to redirect_to("/login")
    end 
  end 

  describe "destroy session" do
    it "destroys session and redirects to /login page" do
      post :destroy
      expect(session[:account_id]).to be_falsey
      expect(response).to redirect_to("/login")
    end 
  end 

end 