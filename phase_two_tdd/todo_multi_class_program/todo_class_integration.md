# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my chores; what I have done and what I have left to do
I want a program that I can add to do items to a list, return those I still have to complete, those which have been completed, and give up if I don't want to do any more chores

## 2. Design the Class Interface

```ruby
# EXAMPLE

class TodoList
  def initialize
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
  end

  def incomplete
    # Returns all non-done todos
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end

class Todo
  def initialize(task) # task is a string
    # ...
  end

  def task
    # Returns the task as a string
  end

  def mark_done!
    # Marks the todo as done
    # Returns nothing
  end

  def done?
    # Returns true if the task is done
    # Otherwise, false
  end
end
```

## 3. Create Examples as Tests

```ruby
# EXAMPLE

# 1 Integration test: After Todos are #add'ed to TodoList, #incomplete returns list of active Todos
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_list.incomplete => "make bed, walk the dog"

# 2 Todo unit test: Will need a unit test in Todo to initialize task and return #task as a string
chore_1 = Todo.new("make bed")
chore_1.task => "make bed"

# 3 TodoList unit test: When TodoList is initiated, initially, #incomplete will return empty array 
chore_list = TodoList.new
chore_list.incomplete => []

# 4 Todo unit test: When Todo #done? is called it will return a boolean value to check if the task has been #mark_done!
chore_1 = Todo.new("make bed")
chore.mark_done!
chore.done? => true

# 5 Integration test: After Todos are #add'ed to TodoList, #complete returns Todos which have been #done?
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_1.mark_done!
chore_list.complete => [chore_1.task] => ["make bed"]

# 6 Integration test: After multiple Todos are #add'ed to TodoList, #complete returns Todos which have been #done?
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_3 = Todo.new("take bins out")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_list.add(chore_3)
chore_1.mark_done!
chore_3.mark_done!
chore_list.complete => [chore_1.task, chore_3.task] => ["make bed, take bins out"]

# 7 TodoList unit test: When TodoList is initiated, but no todos added, #complete will return fail message 
chore_list = TodoList.new
chore_list.complete => "No tasks to complete"

# 8 TodoList unit test: When TodoList is initiated, but no todos added, #give_up! will return fail message 
chore_list = TodoList.new
chore_list.give_up! => "No tasks to complete"

# 9 Integration test: When TodoList #incomplete is called, it will call Todo #done? method to check if it is complete, and return those which are false (i.e. not complete)
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_3 = Todo.new("take bins out")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_list.add(chore_3)
chore_1.mark_done!
chore_3.mark_done!
chore_list.incomplete => [chore_2.task] => ["walk the dog"]

# 10 Integration test: #give_up! method will call the Todo #mark_done! method on all todos. Run TodoList #incomplete which will return nil
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_3 = Todo.new("take bins out")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_list.add(chore_3)
chore_list.give_up!
chore_list.incomplete => "No tasks to complete"

# 11 Integration test: #give_up! method will call the Todo #mark_done! method on all todos. Run TodoList #complete which will return all Todos
chore_list = TodoList.new
chore_1 = Todo.new("make bed")
chore_2 = Todo.new("walk the dog")
chore_3 = Todo.new("take bins out")
chore_list.add(chore_1)
chore_list.add(chore_2)
chore_list.add(chore_3)
chore_list.give_up!
chore_list.complete => "make bed, walk the dog, take bins out"

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._