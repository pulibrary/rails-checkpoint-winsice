class Playlist < ApplicationRecord
    has_many :song
    belongs_to :account
    
end
