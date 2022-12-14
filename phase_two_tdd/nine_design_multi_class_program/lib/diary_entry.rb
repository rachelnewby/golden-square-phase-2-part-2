class DiaryEntry
  def initialize(date, contents) # date is integer, contents is string
    # ...
    @date = date
    @contents = contents
  end
  def read_entry
    # Returns contents as string
    fail "Error: need to enter contents" if @contents == "" || @contents == " "
    "#{@date}: #{@contents}"
  end

  def read_date
    return @date
  end
  def word_count
    # Counts the words in the contents
    # Returns integer
    return @contents.split.length
  end

  def todo
    # It will check instance of diary_entry contents for 'todo'
    # returns the 'todo'
    if self.read_entry.include?("to do")
      return self.read_entry.match("to do: (.*)")[1]
    end
  end

  def number
    # It will check instance of diary_entry contents for number
    # returns the number
    return self.read_entry[/\d\d\d\d\d\d\d\d\d\d\d/] if self.read_entry.match(/\d\d\d\d\d\d\d\d\d\d\d/)
  end
end

