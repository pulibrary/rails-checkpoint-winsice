require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      username: "MyText",
      password: "MyText"
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "textarea[name=?]", "account[username]"

      assert_select "textarea[name=?]", "account[password]"
    end
  end
end
