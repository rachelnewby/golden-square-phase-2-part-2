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
    return @list.reject(&:done?).map(&:task).join(", ")
    # First all instances where done? is true are rejected.
    # Then we map the rest to their task strings.
    # Then we join the task strings with a comma and space
  end
 
  def complete
    # Returns all complete todos
    return [] if @list.empty?
    return @list.select(&:done?).map(&:task).join(", ")
  end

  def give_up!
    # Marks all todos as complete
    #(Could iterate over each in the array and call the mark_done! method)
    @list.each(&:mark_done!)
  end
end