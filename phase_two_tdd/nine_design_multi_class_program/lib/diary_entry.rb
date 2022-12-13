class DiaryEntry
  def initialize(date, contents) # date is integer, contents is string
    # ...
    @date = date
    @contents = contents
  end
  def read_entry
    # Returns contents as string
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
end