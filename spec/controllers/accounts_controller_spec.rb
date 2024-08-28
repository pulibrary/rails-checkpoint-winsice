require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  let(:account_parameters) do
    {
      id: 1,
      username: "text",
      password: "text"
    }
  end 

  describe "GET #login" do
    it "returns a successful response" do
      get :login
      expect(response).to be_successful
    end 
  end
  
  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end 
  end 

  describe "POST #create" do
    it "creates a new account, logs in, and redirects to index page" do
      post :create, params: { account: account_parameters }
      expect(session[:account_id]).to be_truthy
      expect(response).to redirect_to("/")
    end 
  end 
end 