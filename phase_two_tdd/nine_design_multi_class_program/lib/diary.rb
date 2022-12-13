class Diary
  def initialize
    @entries = []
  end

  def add(diary_entry) # diary_entry is an instance of DiaryEntry
    # DiaryEntry gets added to the diary 
    # Returns nothing
  end

  def read
    
  end

  def readable(reading_speed, time) # Both integers
    # Returns list of diary entries that are readable in the legnth of time available 
  end

  def select(diary_entry) # String - instance of DiaryEntry
    # Returns date and contents of diary entry inputted
  end
end