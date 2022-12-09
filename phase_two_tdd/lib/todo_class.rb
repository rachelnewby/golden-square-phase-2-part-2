class Todo
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def print_list
    @tasks.empty? ? "No chores to print" : @tasks.join(", ")
  end

  def complete(remove)
    @tasks.include?(remove) ? @tasks.delete(remove) : "Chore doesn't exist"
  end
end
