require 'playlist'

describe Playlist do
  context "When tracks have been added to the playlist" do
    it "prints the playlist with #print_track_list method" do
      playlist = Playlist.new
      playlist.add("In the end")
      expect(playlist.print_track_list).to eq "In the end"
    end

    it "prints the song added in previous instances when #print_track_list is called" do
      playlist = Playlist.new
      playlist.add("In the end")
      playlist.add("Cane sugar")
      expect(playlist.print_track_list).to eq "In the end, Cane sugar"
    end

    it "prints all the songs added in previous instances when #print_track_list is called" do
      playlist = Playlist.new
      playlist.add("In the end")
      playlist.add("Cane sugar")
      playlist.add("Firestarter")
      expect(playlist.print_track_list).to eq "In the end, Cane sugar, Firestarter" 
    end

    it "returns an error message when you try and add a song already in the list" do
      playlist = Playlist.new
      playlist.add("In the end")
      playlist.add("Cane sugar")
      playlist.add("Firestarter")
      expect(playlist.add("In the end")).to eq "You've already added that track"
    end

    it "returns an error message when you try and add a song already in the list" do
      playlist = Playlist.new
      playlist.add("In the end")
      playlist.add("Cane sugar")
      playlist.add("Firestarter")
      expect(playlist.add("In the end")).to eq "You've already added that track"
      expect(playlist.print_track_list).to eq "In the end, Cane sugar, Firestarter" 
    end
  end
  context "When no songs are in the playlist" do
    it "returns an error message" do
      playlist = Playlist.new
      expect(playlist.print_track_list).to eq "No tracks to print - listen to some music!"
    end
  end
end