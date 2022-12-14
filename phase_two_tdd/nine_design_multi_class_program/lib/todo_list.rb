class TodoList
  def initialize
    @list = []
  end

  def add(task) # task is an instance of Task class
    # Task is added to TodoList
    # Returns nothing
    @list << task
  end

  def print 
    # Prints all the todo list items
    return @list.compact
  end
end