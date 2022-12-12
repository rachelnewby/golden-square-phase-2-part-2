require 'diary'
require 'diary_entry'

describe "Diary Integration" do
  it "lists out the entries added" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
    entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.all).to eq [entry_1, entry_2]
    end

  describe "word counting behaviour" do
    it "counts the words in all diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Entry 1", ("words " * 200))
      entry_2 = DiaryEntry.new("Entry 2", ("words " * 400))
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 600
    end
  end 

  describe "reading time behaviour" do
    it "fails where wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Entry 1", "one two three")
      diary.add(entry_1)
      expect { diary.reading_time(0) }. to raise_error "WPM must be positive"
    end

    it "calculates the reading time for all entries where it fits exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Entry 1", ("words words words"))
      entry_2 = DiaryEntry.new("Entry 2", ("words words words"))
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end

    it "calculates the reading time for all entries where it falls over a minute" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Entry 1", ("words words"))
      entry_2 = DiaryEntry.new("Entry 2", ("words words words"))
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  describe "best reading time entry behaviour" do
    it "fails where wpm is 0" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Entry 1", "my contents longer")
      diary.add(entry_1)
      expect { diary.find_best_entry_for_reading_time(0, 1)}.to raise_error "WPM must be positive"
    end

    context "where we just have one entry and it is readable in the time" do 
      it "returns that entry" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Entry 1", "my contents")
        diary.add(entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq entry_1
      end
    end
    context "where we have just one entry and it is unreadable in the time" do
      it "returns nil" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Entry 1", "my contents longer")
        diary.add(entry_1)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end
    context "where we have multiple entries" do
      it "returns the longest entry you can read in the time" do
        diary = Diary.new
        best_entry = DiaryEntry.new("Entry 2", "one two")
        diary.add(best_entry)
        diary.add(DiaryEntry.new("Entry 1", "one"))
        diary.add(DiaryEntry.new("Entry 3", "one two three"))
        diary.add(DiaryEntry.new("Entry 4", "one two three four"))
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq best_entry
      end
    end
  end
end