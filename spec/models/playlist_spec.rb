require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe "attributes relevant to Playlist" do
    it {is_expected.to respond_to :playlist_name}
    it {is_expected.to respond_to :playlist_link}
    it {is_expected.to respond_to :amount_of_listens}
    it {is_expected.to respond_to :account_id}
    it {is_expected.to respond_to :category}
  end 
end
