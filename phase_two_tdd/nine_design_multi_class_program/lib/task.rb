class Task # you could add this into the initalize in the DiaryEntry rather than as a separate task class
  def initialize(diary_entry) # diary_entry is an instance of DiaryEntry
    #...
  end

  def todo
    # It will check instance of diary_entry contents for 'todo'
    # returns the 'todo'
  end
end