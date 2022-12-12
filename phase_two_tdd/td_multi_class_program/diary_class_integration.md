# {{PROBLEM}} Class Design Recipe

## 1. Describe the problem 
As a user
So that I can keep a record of my diary entries and how long it takes to read each one
I want a program that I can add diary entries, calculate how long it takes to read diary entries and return the best diary entries to read based on the length of time I have available to read

## 2. Design the Class Inteface

```ruby

#EXAMPLE: diary.rb
class Diary
  def initialize
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    # Returns a list of instances of DiaryEntry
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
        # `wpm` is an integer representing the number of words the user can read
        # per minute.
        # `minutes` is an integer representing the number of minutes the user
        # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
end

#EXAMPLE: diary_entry.rb
class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    # ...
  end

  def title
    # Returns the title as a string
  end

  def contents
    # Returns the contents as a string
  end

  def count_words
    # Returns the number of words in the contents as an integer
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end
```

## 3. Create examples as tests

```ruby

# 1 - gets all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
diary.add(entry_1)
diary.add(entry_2)
diary.all => [entry_1, entry_2]

# 2 - returns number of words in all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
entry_3 = DiaryEntry.new("Entry 3", ("words " * 300))
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
dairy.count_words => 900

# 3 - returns the length of time it will take to read all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
entry_3 = DiaryEntry.new("Entry 3", ("words " * 300))
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
dairy.reading_time(200) => 5 

# 4 - returns the title and contents of diary entry based on the wpm and length of time someone can read and has to read. The number of words should not be over the length of time (based on their speed)
diary = Diary.new
entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
entry_3 = DiaryEntry.new("Entry 3", ("words " * 300))
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
dairy.reading_time(200, 2) => entry_2.title, entry_2.contents
