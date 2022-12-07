{{PROBLEM}} Method Design Recipe
1. Describe the Problem
As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO.

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.


```ruby
todo_checker(input)
# A method which expects a string and returns a true or false value. No side effects. 
```

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

todo_checker(1234) => "Raise error - wrong input"
todo_checker('#TODO') => true
todo_checker('to do') => false

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.