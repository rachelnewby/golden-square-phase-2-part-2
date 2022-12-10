class Playlist
  def initialize
    @songs = []
  end

  def add(track)
    return @songs.include?(track) ? "You've already added that track" : @songs << track
  end

  def print_track_list
    return @songs.empty? ? "No tracks to print - listen to some music!" : @songs.join(", ")
  end
end