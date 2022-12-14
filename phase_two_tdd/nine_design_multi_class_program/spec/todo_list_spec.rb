require 'todo_list'

describe TodoList do
  context "constructs" do
    it "#print initially returns empty array" do
      todo_list = TodoList.new
      expect(todo_list.print).to eq []
    end
  end
end
