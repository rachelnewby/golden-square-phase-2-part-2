require 'todo'

describe Todo do
  context "When new instance intialized;" do
    it "#task returns the string" do
      chore_1 = Todo.new("make bed")
      expect(chore_1.task).to eq "make bed"
    end
    
    it "#done? returns false" do
      expect(Todo.new("make bed").done?).to eq false
    end
  end
  
  context "After #mark_done! is called" do
    it "#done? returns true" do
      todo = Todo.new("make bed")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
  
end


