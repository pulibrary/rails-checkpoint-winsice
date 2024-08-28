require "rails_helper"

RSpec.describe SongsController, type: :routing do
  describe "routing" do
    it "routes to #delete" do
      expect(get: "/songs/1/delete").to route_to("songs#delete", id: "1")
    end

    it "routes to #destroy" do
      expect(post: "/songs/1/delete").to route_to("songs#destroy", id: "1")
    end
  end
end
