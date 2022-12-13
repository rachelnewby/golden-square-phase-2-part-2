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
 │  all diary entries         │             │ in the entries            ├────────────┐
 │                            │             │                           │            │
 │ Select -- works out length │             │                           │            │
 │  time to read diary entry  │             │                           │            │
 │  based on wpm and time     │             │                           │            │
 │  available                 │             │                           │            │
 └────────────────────────────┘             └────────────┬──────────────┘            │
                                                         │                           │
                                                         │                           │
                                                         │                           │
                                                         │                           │
                                                         │                           │
                                                         ▼                           │
┌────────────────────────────┐              ┌───────────────────────────┐            │
│       TODO LIST            │              │         TASK              │            │
│ -------------------------  │              │ ------------------------  │            │
│                            │              │                           │            │
│ Record -- adds new tasks   │◄─────────────┤  Reviews diary entry      │            │
│                            │              │  contents and searches    │            │
│ Print -- returns list of   │              │  for todos. Each instance │            │
│  tasks                     │              │  of task is derived from  │            │
│                            │              │  each instance of diary   │            │
│                            │              │  entry                    │            │
│                            │              │                           │            │
│                            │              │                           │            │
│                            │              │                           │            │
│                            │              │                           │            │
└────────────────────────────┘              └───────────────────────────┘            │
                                                                                     │
                                                                                     │
                                                                                     │
                                                                                     │
┌───────────────────────────┐                ┌──────────────────────────┐            │
│       CONTACT LIST        │                │        CONTACT           │            │
│ ------------------------  │                │ -----------------------  │            │
│                           │                │                          │            │
│ Record -- adds new number │                │ Reviews diary entry      │            │
│                           │                │ contents and searches    │            │
│ Print -- returns list of  │◄───────────────┤ for numbers. Each        │◄───────────┘
│  contacts                 │                │ instand of contact is    │
│                           │                │ derived from each        │
│                           │                │instance of diary entry   │
│                           │                │                          │
│                           │                │                          │
│                           │                │                          │
└───────────────────────────┘                └──────────────────────────┘
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

  def select(diary_entry) # String - instance of DiaryEntry
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
end

class TodoList
  def initialize
    # ...
  end

  def add(task) # task is an instance of Task class
    # Task is added to TodoList
    # Returns nothing
  end

  def print 
    # Prints all the todo list items
  end
end

class Task # you could add this into the initalize in the DiaryEntry rather than as a separate task class
  def initialize(diary_entry) # diary_entry is an instance of DiaryEntry
    #...
  end

  def todo
    # It will check instance of diary_entry contents for 'todo'
    # returns the 'todo'
  end
end

class ContactList
  def initialize
    #...
  end

  def add(contact) # contact is an instance of Contact
    # Contact is added to ContactList
    # Nothing is returned
  end

  def print
    #Prints all the contacts in the list
  end
end

class Contact # you could add this into the initalize in the DiaryEntry rather than as a separate contact class 
  def initialize(diary_entry) # diary_entry is an instance of Diary Entry
    #...
  end

  def number
    # It will check instance of diary_entry contents for number
    # returns the number
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1 Reads all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.read => ["121222, dear diary, today this happened", "101222, hello diary this happened it was great", "111222, I met Dani today her number is 07123456789", "91222, I have a lot to do: wash the dishes"]

# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._