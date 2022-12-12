require 'todo_list'
require 'todo'

describe "Integration tests for TodoList and Todo" do 
  context "When all Todo instances are incomplete;" do
    it "returns Todos in array when #incomplete called" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      expect(chore_list.incomplete).to eq "make bed, walk the dog"
    end
  end
end
