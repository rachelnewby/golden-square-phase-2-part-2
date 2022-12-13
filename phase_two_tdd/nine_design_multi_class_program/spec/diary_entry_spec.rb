require 'diary_entry'

describe DiaryEntry do
  context "Initially" do
    it "initializes a new instance" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.instance_variable_get(:@contents)).to eq "dear diary, today this happened"
      expect(entry_1.instance_variable_get(:@date)).to eq 121222
    end
  end

  context "When a diary entry has date and contents" do
    it "#word count" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.word_count).to eq 5
    end
  end
end