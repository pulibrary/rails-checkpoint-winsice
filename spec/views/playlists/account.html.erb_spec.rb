require 'rails_helper'
require_relative '../../support/controller_helper.rb'

RSpec.configure do |c|
  c.include ControllerHelper
end

RSpec.describe "playlists/account", type: :view do

  let(:account) { Account.first }

  it "renders the account search form" do
    login(account)
    assign(:post_url, account_path)
    assign(:playlists, Playlist.all)

    render
  
    assert_select "form input", 19

    assert_select "form[action=?][method=?]", account_path, "post" do

      assert_select "input[name=?]", "playlist_name"
      assert_select "input[name=?]", "amount_of_listens"
      assert_select "input[name=?]", "category[]"
      assert_select "input[type=?]", "submit"
  
    end
  end
end
