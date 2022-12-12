require 'diary_entry'

describe DiaryEntry do
  it "contructs" do
    entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
    #entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
    expect(entry_1.title).to eq "Entry 1"
    expect(entry_1.contents).to eq "words " * 200
  end

  describe "#count_words" do
    it "returns zero if the contents is empty" do
      entry_1 = DiaryEntry.new("Entry 1", "")
      expect(entry_1.count_words).to eq 0
    end
    it "returns 1 if the contents is one word" do
      entry_1 = DiaryEntry.new("Entry 1", "one")
      expect(entry_1.count_words).to eq 1
    end
    it "counts the words in contents" do
      entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
      expect(entry_1.count_words).to eq 200
    end
  end

  describe "#reading_time" do
  it "fails if the wpm is 0" do
    entry_1 = DiaryEntry.new("Entry 1", "one two three")
    expect { entry_1.reading_time(0) }. to raise_error "WPM must be positive"
  end

  it "returns zero if the contents is empty" do
    entry_1 = DiaryEntry.new("Entry 1", "")
    expect(entry_1.reading_time(2)).to eq 0
  end
  it "returns 1 if the contents is one word" do
    entry_1 = DiaryEntry.new("Entry 1", "one")
    expect(entry_1.reading_time(2)).to eq 1
  end
  it "returns a reading time for the contents" do
    entry_1 = DiaryEntry.new("Entry 1", "one two three four five")
    expect(entry_1.reading_time(2)).to eq 3
  end
end
end