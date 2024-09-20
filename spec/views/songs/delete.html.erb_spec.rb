require 'rails_helper'

RSpec.describe "songs/delete", type: :view do

  it "renders the delete song form" do

    assign(:song, Song.first)

    render

    assert_select "form[action=?][method=?]", "/playlists/1/edit", "get" do
      assert "form input", 1
      assert_select "input[type=?]", "submit"
    end 

    assert_select "form[action=?][method=?]", "/songs/1/delete", "post" do
      assert "form input", 1
      assert_select "input[type=?]", "submit"
    end 

  end

end 