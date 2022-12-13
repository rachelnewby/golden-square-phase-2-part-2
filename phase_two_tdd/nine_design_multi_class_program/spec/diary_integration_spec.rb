require 'diary' 
require 'diary_entry'
require 'todo_list'
require 'task'
require 'contact'
require 'contact_list'

describe "Diary Integration test" do
  context "New diary created and diary entry instances have been added" do
    it "#read returns the diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new(121222, "dear diary, today this happened")
      # entry_2 = DiaryEntry.new(101222, "hello diary this happened it was great")
      # entry_3 = DiaryEntry.new(111222, "I met Dani today her number is 07123456789")
      # entry_4 = DiaryEntry.new(91222, "I have a lot to do: wash the dishes")
      # diary.add(entry_1)
      # diary.add(entry_2)
      # diary.add(entry_3)
      # diary.add(entry_4)
      # expect(diary.read).to eq ["121222, dear diary, today this happened", "101222, hello diary this happened it was great", "111222, I met Dani today her number is 07123456789", "91222, I have a lot to do: wash the dishes"]
    end
  end
end
