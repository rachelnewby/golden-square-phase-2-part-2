class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @list << todo
  end

  def incomplete
    # Returns all non-done todos
    return [] if @list.empty?
    return @list.map(&:task).join(", ")
  end
 
  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
    #(Could iterate over each in the array and call the mark_done! method)
  end
end