require 'rails_helper'

RSpec.describe "accounts/login", type: :view do
  context "when loading /login page" do
    it "renders login form" do
      render

      assert_select "form input", 3

      assert_select "form[action=?][method=?]", login_path, "post" do
        assert_select "input[name=?]", "username"
        assert_select "input[name=?]", "password"
        assert_select "input[type=?]", "submit"
      end
      
    end
  end 
end  