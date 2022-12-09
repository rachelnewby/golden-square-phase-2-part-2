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
end