require "rails_helper"

RSpec.describe AccountsController, type: :routing do
  describe "routing" do
    it "routes to #login" do
      expect(get: "/login").to route_to("accounts#login")
    end

    it "routes to #new" do
      expect(get: "/createaccount").to route_to("accounts#new")
    end

    it "routes to #create" do
      expect(post: "/createaccount").to route_to("accounts#create")
    end
    
  end
end
