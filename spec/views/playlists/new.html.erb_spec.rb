require 'rails_helper'

RSpec.describe "playlists/new", type: :view do

  it "renders new playlist form" do

    render

    assert_select "form input", 15

    assert_select "form[action=?][method=?]", playlists_new_path, "post" do

      assert_select "input[name=?]", "playlist_name"
      assert_select "input[name=?]", "playlist_link"

      assert_select "input[name=?]", "category[]"
      assert_select "input[type=?]", "submit"

    end
  end
end
