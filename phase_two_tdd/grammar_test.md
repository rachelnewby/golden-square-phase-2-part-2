{{PROBLEM}} Method Design Recipe
1. Describe the Problem
As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.



2. Design the Method Signature


```ruby
grammar_checker
# A method that takes in a string and return string detailing why it passed or failed
```

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

# EXAMPLE


grammar_checker(1234) => "Error, wrong type of input class"
grammar_checker('dinner is at 8.') => "Error, sentence doesn't start with a capital letter."
grammer_checker('Dinner is at 8') => "Error, sententence doesn't finish with a puncutation mark."
grammar_checker(dinner is at 8) => "Error, sentence doesn't start with a capital and doesn't end with a punctuation mark."
grammer_checker('Dinner is at 8?') => Pass, sentence starts with a capital and ends with a punctuation mark."


4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.