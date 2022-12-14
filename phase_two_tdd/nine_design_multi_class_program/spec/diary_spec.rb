require "diary"

describe Diary do
  context "initally" do
    it "#read will return empty array" do
      diary = Diary.new
      expect(diary.read).to eq []
    end

    it "#readable will return an empty array" do
      diary = Diary.new
      expect(diary.readable(2, 1)).to eq []
    end

    it "#readable will throw an error if minutes to read is less than 1" do
      diary = Diary.new
      expect { diary.readable(2,0) }. to raise_error "Error: check reading speed or minutes"
    end 

    it "#readable will throw an error if minutes to read is less than 1" do
      diary = Diary.new
      expect { diary.readable(0, 2) }. to raise_error "Error: check reading speed or minutes"
    end 
  end
end