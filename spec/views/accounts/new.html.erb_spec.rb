require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  context "when loading /createaccount page" do
    it "renders new account form" do
      render

      assert_select "form input", 3

      assert_select "form[action=?][method=?]", createaccount_path, "post" do
        assert_select "input[name=?]", "username"
        assert_select "input[name=?]", "password"
        assert_select "input[type=?]", "submit"
      end

    end
  end
end 
