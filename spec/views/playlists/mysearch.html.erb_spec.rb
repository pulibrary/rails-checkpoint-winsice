require 'rails_helper'

RSpec.describe "playlists/search", type: :view do

  it "renders the search playlist search form for user's accounts" do

    assign(:playlists, Playlist.all)

    render
  
    assert_select "form input", 20

    assert_select "form[action=?][method=?]", playlists_search_path, "post" do

      assert_select "input[name=?]", "username"
      assert_select "input[name=?]", "playlist_name"

      assert_select "input[name=?]", "amount_of_listens"
      assert_select "input[name=?]", "category[]"
      
      assert_select "input[type=?]", "submit"
      
    end
  end
end
