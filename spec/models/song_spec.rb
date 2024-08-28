require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "attributes relevant to Song" do 
    it {is_expected.to respond_to :playlist_id}
    it {is_expected.to respond_to :song_name}
    it {is_expected.to respond_to :artist}
  end 
end
