require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  let(:account) {
    Account.create!(
      username: "MyText",
      password: "MyText"
    )
  }

  before(:each) do
    assign(:account, account)
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(account), "post" do

      assert_select "textarea[name=?]", "account[username]"

      assert_select "textarea[name=?]", "account[password]"
    end
  end
end
