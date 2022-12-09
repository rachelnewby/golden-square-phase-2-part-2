require 'todo_class'

describe Todo do
  context "#add will add a chore to the list and #print method will return" do
    it "will print the new chore" do
      chore = Todo.new
      chore.add("make bed")
      expect(chore.print_list).to eq "make bed"
    end
    it "will print the new chore and previous chore" do
      chore = Todo.new
      chore.add("make bed")
      chore.add("wash clothes")
      expect(chore.print_list).to eq "make bed, wash clothes"
    end
    it "will print the new chore and previous chores" do
      chore = Todo.new
      chore.add("make bed")
      chore.add("wash clothes")
      chore.add("walk the dog")
      expect(chore.print_list).to eq "make bed, wash clothes, walk the dog"
    end
  end
  
  context "#complete will remove the chore from the list and #print_list will return updated list" do
    it "will check the list of chores and remove what we ask it to remove" do
      chore = Todo.new
      chore.add("make bed")
      chore.add("wash clothes")
      chore.add("walk the dog")
      chore.complete("make bed")
      expect(chore.print_list).to eq "wash clothes, walk the dog"
    end
    it "will check the list of chores and remove what we ask it to remove" do
      chore = Todo.new
      chore.add("make bed")
      chore.add("wash clothes")
      chore.add("walk the dog")
      chore.complete("make bed")
      chore.complete("walk the dog")
      expect(chore.print_list).to eq "wash clothes"
    end
  end
  context "managing user errors" do
    it "will return a string if a chore is not present when user requests removal" do
      chore = Todo.new
      chore.add("make bed")
      chore.add("wash clothes")
      chore.add("walk the dog")
      expect(chore.complete("take the bin out")).to eq "Chore doesn't exist"
    end

    it "will return a string if no chores are present to print" do
      chore = Todo.new
      expect(chore.print_list).to eq "No chores to print"
    end
  end
end