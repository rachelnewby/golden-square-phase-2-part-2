require 'todo_list'

describe TodoList do 
  it "constructs" do
    chore_list = TodoList.new
  end

  context "initally" do
    it "#incomplete will return empty array" do
      chore_list = TodoList.new
      expect(chore_list.incomplete).to eq []
    end
    it "#complete will return an empty array" do
      chore_list = TodoList.new
      expect(chore_list.complete).to eq []
    end
  end
end