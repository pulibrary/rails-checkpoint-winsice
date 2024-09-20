require 'rails_helper'
require_relative '../support/controller_helper.rb'

RSpec.configure do |c|
  c.include ControllerHelper
end

RSpec.describe SongsController, type: :controller do

  let(:song) { Song.first }

  describe "GET #delete" do 
    it "returns a successful response" do 
      get :delete, params: { id: song.id }
      expect(response).to be_successful
    end 
  end 

  describe "POST #destroy" do
    it "deletes song and redirects to playlist's edit page" do
      post :destroy, params: { id: song.id }
      expect(response).to redirect_to("/playlists/#{song.playlist_id}/edit")
    end 
  end 

end 