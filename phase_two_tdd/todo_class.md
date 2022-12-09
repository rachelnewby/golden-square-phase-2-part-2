{{PROBLEM}} Class Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.


2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class Todo
  def initialize
    #empty array to keep hold of my todos
  end

  def add(task)
   #method to add a task to todo list
  end

  def print_list
    #method to print your existing todos
  end

  def complete(task)
    #checks to see if the todo list has the task in it and if so remove task from todo list 
    #Throws error if task is not in todo list
  end
end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
chore = Todo.new
chore.add("make bed")
chore.print_list => "make bed"

# 2
chore = Todo.new
chore.add("make bed")
chore.add("wash clothes")
chore.print_list => "make bed, wash clothes"

# 3
chore = Todo.new
chore.add("make bed")
chore.add("wash clothes")
chore.add("walk the dog")
chore.print_list => "make bed, wash clothes, walk the dog"

# 4
chore = Todo.new
chore.add("make bed")
chore.add("wash clothes")
chore.add("walk the dog")
chore.complete("make bed")
chore.print_list => "wash clothes, walk the dog"

# 5
chore = Todo.new
chore.add("make bed")
chore.add("wash clothes")
chore.add("walk the dog")
chore.print_list => "make bed, wash clothes, walk the dog"
chore.complete("make bed")
chore.complete("walk the dog")
chore.print_list => "wash clothes"

# 6
chore = Todo.new
chore.add("make bed")
chore.add("wash clothes")
chore.add("walk the dog")
chore.complete("take the bin out") => "Chore doesn't exist"

# 7 
chore = Todo.new
chore.print_list => "No chores to print"

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.