require 'todo'

describe Todo do
  context "When new instance intialized;" do
    it "#task returns the string" do
      chore_1 = Todo.new("make bed")
      expect(chore_1.task).to eq "make bed"
    end
  end
end


