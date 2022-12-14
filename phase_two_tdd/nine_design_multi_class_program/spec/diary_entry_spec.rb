require 'diary_entry'

describe DiaryEntry do
  context "When class has been initialized but with an empty string" do
    it "#read_entry" do
      entry_1 = DiaryEntry.new(121222, " ")
      expect { entry_1.read_entry } .to raise_error "Error: need to enter contents"
    end
  end

  context "When class has been initialized with a new instance" do
    it "#read_entry" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.read_entry).to eq "121222: dear diary, today this happened"
    end

    it "#read_entry" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.read_date).to eq 121222
    end
  end

  context "When a diary entry has date and contents" do
    it "#word count" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.word_count).to eq 5
    end
  end

  context "When diary entry added and todo contents value valid" do
    it "#todo will return the string" do
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
      expect(entry_4.todo).to eq "wash the dishes."
    end
  end

  context "When diary entry added and todo contents are not included" do
    it "#todo will return nil" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.todo).to eq nil 
    end
  end

  context "When diary entry added and number contents value valid" do
    it "#number will return the string" do
      entry_4 = DiaryEntry.new(91222, "I met Dani today her number is 07123456789")
      expect(entry_4.number).to eq "07123456789"
    end
  end

end