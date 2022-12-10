{{PROBLEM}} Class Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class Playlist
  def initialize
    #Create an array here which contains tracks listened to
  end

  def add(track)
    #method which takes a string and adds to an array of tracks listened to. Nothing returned
  end

  def print_track_list
    #method which prints a string of all tracks listened to from array
    #returns a string indicating an error when there are no tracks to print out
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
playlist = Playlist.new
playlist.add("In the end")
playlist.print_track_list => "In the end"

# 2
playlist = Playlist.new
playlist.add("In the end")
playlist.add("Cane sugar")
playlist.print_track_list => "In the end, Cane sugar"

# 3
playlist = Playlist.new
playlist.add("In the end")
playlist.add("Cane sugar")
playlist.add("Firestarter")
playlist.print_track_list => "In the end, Cane sugar, Firestarter"

# 4 
playlist = Playlist.new
playlist.add("In the end")
playlist.add("Cane sugar")
playlist.add("Firestarter")
playlist.add("In the end") => "You've already added that track"

# 5
playlist = Playlist.new
playlist.print_track_list => "No tracks to print. Listen to some music!"

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.