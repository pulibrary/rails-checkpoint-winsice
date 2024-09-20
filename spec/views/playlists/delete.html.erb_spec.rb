require 'rails_helper'

RSpec.describe "playlists/delete", type: :view do

  let(:account) { Account.first }
  let(:playlist) { Playlist.first }

  it "renders the delete page buttons" do

    assign(:playlist, playlist)
    render
  
    assert_select "form input", 2

    assert_select "form[action=?][method=?]", '/playlists/1/delete', "post" do
      assert_select "input[type=?]", "submit"
    end

    assert_select "form[action=?][method=?]", account_path, "get" do
      assert_select "input[type=?]", "submit"
    end

  end
end
