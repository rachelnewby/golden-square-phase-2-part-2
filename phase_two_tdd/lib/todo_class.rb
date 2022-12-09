class Todo
  def initialize
    @tasks = []
  end

  def add(task)
    @tasks << task
  end

  def print_list
    return @tasks.join(", ")
  end

  def complete(remove)
    @tasks.include?(remove) ? @tasks.delete(remove) : "Chore doesn't exist"
  end
end
