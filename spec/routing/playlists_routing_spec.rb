require "rails_helper"

RSpec.describe PlaylistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/").to route_to("playlists#index")
    end

    it "routes to #discover" do
      expect(get: "/playlists/discover").to route_to("playlists#discover")
    end 

    it "routes to #account" do
      expect(get: "/account").to route_to("playlists#account")
    end

    it "routes to #new" do
      expect(get: "/playlists/new").to route_to("playlists#new")
    end

    it "routes to #edit" do
      expect(get: "/playlists/1/edit").to route_to("playlists#edit", id: "1")
    end

    it "routes to #info" do
      expect(get: "/playlists/1/info").to route_to("playlists#info", id: "1")
    end

    it "routes to #delete" do
      expect(get: "/playlists/1/delete").to route_to("playlists#delete", id: "1")
    end

    it "routes to #my_search" do
      expect(post: "/account/search").to route_to("playlists#my_search")
    end

    it "routes to #search" do
      expect(post: "/playlists/search").to route_to("playlists#search")
    end

    it "routes to #create" do
      expect(post: "/playlists/new").to route_to("playlists#create")
    end

    it "routes to #update" do
      expect(post: "/playlists/1/edit").to route_to("playlists#update", id: "1")
    end

    it "routes to #add_song" do
      expect(post: "/playlists/1/edit/add").to route_to("playlists#add_song", id: "1")
    end

    it "routes to #add_click" do
      expect(post: "/add_click/1").to route_to("playlists#add_click", id: "1")
    end

    it "routes to #destroy" do
      expect(post: "/playlists/1/delete").to route_to("playlists#destroy", id: "1")
    end
  end
end
