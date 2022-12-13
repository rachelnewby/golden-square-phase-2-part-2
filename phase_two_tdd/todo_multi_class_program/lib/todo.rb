class Todo
  def initialize(task) # task is a string
    @task = task
    @complete = false
  end

  def task
    # Returns the task as a string
    return @task
  end

  def mark_done!
    @complete = true
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
    @complete
  end
end