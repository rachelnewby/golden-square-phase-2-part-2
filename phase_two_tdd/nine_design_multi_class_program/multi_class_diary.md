# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries



## 2. Design the Class System

Diary
Record ---> Add new experiences/diary entries
Read entries (reflect experiences) ---> Read all entries
Select ---> Select entries based on their length

Diary Entries
Reflect Expereiences ---> read entries
Time ---> Track the length of time it takes to read an entry 

Todo List ---> holds the todo list
Keep Track ---> Adding new tasks

Tasks ---> Tasks to add with details of the task

Contact list ---> Holds the contacts
Keep Track ---> Adding new numbers

Contacts ---> Numbers to add

```
```
 ┌────────────────────────────┐             ┌───────────────────────────┐
 │           DIARY            │             │          DIARY ENTRY      │
 │ -------------------------  │             │  -----------------------  │
 │                            │             │ Contains diary entries -  │
 │ Record -- add new diary    │◄────────────┤  Takes in a date and a    │
 │          entries           │             │  contents                 │
 │                            │             │                           │
 │ Read entries -- prints out │             │ Length -- counts the words│
 │  all diary entries         │             │ in the entries            │
 │                            │             │                           │
 │ Select -- works out length │             │ Task -- reviews entry and │
 │  time to read diary entry  │             │ searches for todos        │
 │  based on wpm and time     │             │                           │
 │  available                 │             │ Contact -- reviews entry  │
 └────────────────────────────┘             │ and searches for numbers  │
                                            │                           │
                                            │                           │
                                            └───────┬─────────────┬─────┘
                                                    │             │
                                                    │             │
                                                    │             │
┌────────────────────────────┐                      │             │
│       TODO LIST            │                      │             │
│ -------------------------  │                      │             │
│                            │                      │             │
│ Record -- adds new tasks   │                      │             │
│                            │                      │             │
│ Print -- returns list of   │                      │             │
│  tasks                     │◄─────────────────────┘             │
│                            │                                    │
│                            │                                    │
│                            │                                    │
│                            │                                    │
│                            │                                    │
│                            │                                    │
└────────────────────────────┘                                    │
                                                                  │
                                                                  │                                  ▼
                                                                  │
                                                                  │
┌───────────────────────────┐                                     │
│       CONTACT LIST        │                                     │
│ ------------------------  │                                     │
│                           │                                     │
│ Record -- adds new number │                                     │
│                           │                                     │
│ Print -- returns list of  │◄────────────────────────────────────┘
│  contacts                 │
│                           │
│                           │
│                           │
│                           │
│                           │
└───────────────────────────┘
```

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    # ...
  end

  def add(diary_entry) # diary_entry is an instance of DiaryEntry
    # DiaryEntry gets added to the diary 
    # Returns nothing
  end

  def read
    # Returns all the diary entries
  end

  def readable(reading_speed, time) # Both integers
    # Returns list of diary entries that are readable in the legnth of time available 
  end

  def select(diary_entry) # Integer - instance of DiaryEntry
    # Returns date and contents of diary entry inputted
  end
end

class DiaryEntry
  def initialize(date, contents) # date is integer, contents is string
    # ...
  end

  def read_entry
    # Returns contents as string
  end

  def word_count
    # Counts the words in the contents
    # Returns integer
  end

  def todo
    # It will check instance of diary_entry contents for 'todo'
    # returns the 'todo'
  end

  def number
    # It will check instance of diary_entry contents for number
    # returns the number
  end
end

class TodoList
  def initialize
    # ...
  end

  def add(task) # task is from an instance of DiaryEntry class
    # Task is added to TodoList
    # Returns nothing
  end

  def print 
    # Prints all the todo list items
  end
end


class ContactList
  def initialize
    #...
  end

  def add(contact) # contact is from an instance of DiaryEntry class
    # Contact is added to ContactList
    # Nothing is returned
  end

  def print
    #Prints all the contacts in the list
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1 Reads all diary entries that have been added
diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.read => ["121222: dear diary, today this happened", "101222: hello diary this happened it was great", "111222: I met Dani today her number is 07123456789", "91222: I have a lot to do: wash the dishes"]

# 2 Selects readable diary entries based on their word cound and returns a list of titles that are readable in the time frame (based on the time entered being the exact amount needed for the examples)

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.readable(5, 1) => [121222, 101222]

# Selects readable diary entries based on their word count and returns a list of titles that are readable in the time frame (based on the time entered being slightly over amount needed for examples)

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.readable(7, 1) => [121222, 101222]

# User input will select the diary entry to read based on the date input

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.select(121222) => "dear diary, today this happened"

# Search through entry to find todo and print 

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
todo_4 = entry_4.todo
todo_list = Todo.new
todo_list.add(todo_4)
todo_list.print => ["wash the dishes."]

# Search through entry to find todo and print multiple
diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
diary.add(entry_1)
diary.add(entry_4)
todo_4 = entry_4.todo
todo_1 = entry_1.todo
todo_list = Todo.new
todo_list.add(todo_4)
todo_list.add(todo_1)
todo_list.print => ["wash the dishes.", "homework."]

# Search through todo and print multiple - includes example where #todo is called on entry without value present

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
todo_4 = entry_4.todo
todo_1 = entry_1.todo
todo_2 = entry_2.todo
todo_list = Todo.new
todo_list.add(todo_4)
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_list.print => ["wash the dishes.", "homework."]

# Search through entry to find contacts print one

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
contact_1 = entry_3.number
phonebook = ContactList.new
phonebook.add(contact_1)
phonebook.print => ["07123456789"]

# Search through entry to find contacts prints multiple 

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
entry_2 = DiaryEntry.new(101222, "hello diary the plumber is called Dave: 07987654321")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
contact_1 = entry_3.number
contact_2 = entry_2.number
phonebook = ContactList.new
phonebook.add(contact_1)
phonebook.add(contact_2)
phonebook.print => ["07123456789", "07987654321"]

# Search through number and print multiple - includes example where #number is called on entry without value present

diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
entry_2 = DiaryEntry.new(101222, "hello diary the plumber is called Dave: 07987654321")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
contact_1 = entry_3.number
contact_2 = entry_2.number
contact_3 = entry_1.number
phonebook = ContactList.new
phonebook.add(contact_1)
phonebook.add(contact_2)
phonebook.add(contact_3)
phonebook.print => ["07123456789", "07987654321"]


```
## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# DIARY ENTRY CLASS UNIT TEST

# 1 #read_entry do
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_1.read_entry => "121222: dear diary, today this happened"

# 2 #read_entry error
entry_1 = DiaryEntry.new(121222, " ")
entry_1.read_entry => "Error: need to enter contents"

# 3 #read_date do
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
expect(entry_1.read_date).to eq 121222

# 4 #word_count do
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
expect(entry_1.word_count).to eq 5

# 5 #todo with to do value present do
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
entry_4.todo => "wash the dishes."

# 6 #todo without value present do
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_1.todo => nil 

# 7 #number with to do value present do
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_3.number => 07123456789

# 8 #contact without value present do
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_1.number => nil 


#------------------------------------------------------------------------

# DIARY CLASS UNIT TEST

# 1 Initially #read 
diary = Diary.new
diary.read => ""

# 2 Initially #readable 
diary = Diary.new
diary.readable(2, 1) => []

# 3 Initially #readable if minutes to read is less than 1
diary = Diary.new
diary.readable => "Error: check reading speed or minutes"

# 4 Initially #readable if reading speed is less than 1
diary = Diary.new
diary.readable => "Error: check reading speed or minutes"

#------------------------------------------------------------------------

# TODO CLASS UNIT TEST

# 1 Initially #read 
todo_list = Todo.new
todo.print = []

#------------------------------------------------------------------------

# CONTACT LIST CLASS UNIT TEST

# 1 Initially #read 
phonebook = ContactList.new
phonebook.print = []

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._