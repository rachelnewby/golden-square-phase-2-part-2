require "diary"

describe Diary do
  context "initally" do
    it "#read will return empty array" do
      diary = Diary.new
      expect(diary.instance_variable_get(:@entries)).to eq []
    end
  end
end