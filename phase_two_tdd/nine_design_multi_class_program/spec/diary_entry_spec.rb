require 'diary_entry'

describe DiaryEntry do
  context "Initially" do
    it "initializes a new instance" do
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      expect(entry_1.instance_variable_get(:@contents)).to eq ["121222, dear diary, today this happened"]
    end
  end
end