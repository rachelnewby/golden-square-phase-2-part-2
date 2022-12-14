require 'diary'
require 'diary_entry'
require 'todo_list'
require 'contact_list'

describe "Diary Integration test" do
  context "New diary created and diary entry instances have been added" do
    it "#read returns the diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.read).to eq ["121222: dear diary, today this happened", "101222: hello diary this happened it was great", "111222: I met Dani today her number is 07123456789", "91222: I have a lot to do: wash the dishes"]
    end
  end
  context "New diary created and diary entry instances have been added" do
    it "#read returns the diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.read).to eq ["121222: dear diary, today this happened", "101222: hello diary this happened it was great"]
    end
  end
  context "New diary created and diary entry instances have been added" do
    it "#readable returns the diary entries that matches length of time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.readable(5, 1)).to eq [121222]
    end
  end
  context "New diary created and diary entry instances have been added" do
    it "#readable returns multiple diary entries that match length of time" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.readable(5, 1)).to eq [121222, 101222]
    end
  end
  context "New diary created and diary entry instances have been added" do
    it "#readable returns multiple diary entries that don't match time exactly" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.readable(7, 1)).to eq [121222, 101222]
    end
  end

  context "When user enters valid date input" do
    it "#select returns the diary entry string" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      diary.add(entry_1)
      expect(diary.select(121222)).to eq "121222: dear diary, today this happened"
    end
  end

  context "When user enters invalid date input" do
    it "#select returns a string to show error" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      entry_2 = DiaryEntry.new(101222, "hello diary the plumber is called Dave: 07987654321")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.select(90622)).to eq "Date not found in diary"
    end
  end

  context "When entries have been added, and new todo_list class created" do
    it "#print out the todo added to todo_list instances of diary_entry class" do
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
      todo_list = TodoList.new
      todo_list.add(todo_4)
      expect(todo_list.print).to eq ["wash the dishes."]
    
    end
    it "#print out multiple items in array in TodoList" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
      entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
      diary.add(entry_1)
      diary.add(entry_4)
      todo_4 = entry_4.todo
      todo_1 = entry_1.todo
      todo_list = TodoList.new
      todo_list.add(todo_4)
      todo_list.add(todo_1)
      expect(todo_list.print).to eq ["wash the dishes.", "homework."]
    end
  end

  context "When todo called on diary_entry instance that doesn't have content" do
    it "#print excludes that output" do
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
      todo_list = TodoList.new
      todo_list.add(todo_4)
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.print).to eq ["wash the dishes.", "homework."]
    end
  end

  context "When todo called on diary_entry instance that doesn't have content" do
    it "#print excludes that output" do
      diary = Diary.new
      entry_2 = DiaryEntry.new(101222, "hello diary this happened today")
      entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      todo_1 = entry_2.todo
      todo_2 = entry_3.todo
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      expect(todo_list.print).to eq []
    end
  end

  context "When numbers are in the contents of diary entry" do
      it "#print returns the number" do
        diary = Diary.new
        entry_1 = DiaryEntry.new(121222, "dear diary, today I need to do: homework.")
        entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
        entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
        contact_1 = entry_3.number
        phonebook = ContactList.new
        phonebook.add(contact_1)
        expect(phonebook.print).to eq ["07123456789"]
    end

    it "#print out multiple items in array in ContactList" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(101222, "hello diary the plumber is called Dave: 07987654321")
      entry_2 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      contact_1 = entry_1.number
      contact_2 = entry_2.number
      phonebook = ContactList.new
      phonebook.add(contact_1)
      phonebook.add(contact_2)
      expect(phonebook.print).to eq ["07987654321", "07123456789"]
    end

    it "#print out multiple items in array in ContactList and ignores those which don't have the correct output i.e. nil" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(101222, "hello diary the plumber is called Dave: 07987654321")
      entry_2 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      entry_3 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes.")
      contact_1 = entry_1.number
      contact_2 = entry_2.number
      contact_3 = entry_3.number
      phonebook = ContactList.new
      phonebook.add(contact_1)
      phonebook.add(contact_2)
      phonebook.add(contact_3)
      expect(phonebook.print).to eq ["07987654321", "07123456789"]
    end
  end
end