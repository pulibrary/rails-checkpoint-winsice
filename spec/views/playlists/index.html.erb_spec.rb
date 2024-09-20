require 'rails_helper'

RSpec.describe "playlists/index", type: :view do

  it "renders a list of playlists" do
    render
    assert_select "form[action=?][method=?]", "/logout", "post" do 
      assert_select "form input", 1
      assert_select "input[type=?]", "submit"
    end 
  end
end
