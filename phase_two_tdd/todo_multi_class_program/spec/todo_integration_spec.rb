require 'todo_list'
require 'todo'

describe "Integration tests for TodoList and Todo" do 
  context "When all Todo instances are incomplete;" do
    it "#incomplete returns todo.tasks in a string" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      expect(chore_list.incomplete).to eq "make bed, walk the dog"
    end
  end
  
  context "When only some Todo instances are incomplete;" do
    it "returns the incomplete tasks in a string" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      chore_3 = Todo.new("take out bins")
      chore_3.mark_done!
      chore_list.add(chore_3)
      expect(chore_list.incomplete).to eq "make bed, walk the dog"
    end
  end

  context "When some Todo instances are complete;" do
    it "returns the incomplete tasks in a string" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_3 = Todo.new("take out bins")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      chore_list.add(chore_3)
      chore_3.mark_done!
      expect(chore_list.incomplete).to eq "make bed, walk the dog"
    end
  end

  context "When some Todo instances are complete;" do
    it "returns the complete tasks in a string" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_3 = Todo.new("take out bins")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      chore_list.add(chore_3)
      chore_3.mark_done!
      expect(chore_list.complete).to eq "take out bins"
    end
  end
  
  context "When all instances are complete" do
    it "#complete returns todo.tasks in a string" do
      chore_list = TodoList.new
      chore_1 = Todo.new("make bed")
      chore_2 = Todo.new("walk the dog")
      chore_list.add(chore_1)
      chore_list.add(chore_2)
      chore_list.give_up!
      expect(chore_list.complete).to eq "make bed, walk the dog"
    end
  end

  context "When some instances are complete" do
    it "#complete returns the todo.tasks which are complete in a string" do
    chore_list = TodoList.new
    chore_1 = Todo.new("make bed")
    chore_2 = Todo.new("walk the dog")
    chore_list.add(chore_1)
    chore_list.add(chore_2)
    chore_list.give_up!
    chore_list.add(Todo.new("take bins out"))
    expect(chore_list.complete).to eq "make bed, walk the dog"
    end
  end
end
