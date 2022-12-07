require 'todo_checker'

describe "Testing to_do checker method" do
  context "When not passed a string" do
    it "Raises error" do
      expect { todo_checker(1234) }.to raise_error "Error, wrong data input"
    end
  end

  context "Given a string with '#TODO'" do
    it "Returns true" do
      sentence = 'Today I have #TODO jobs'
      expect(todo_checker(sentence)).to eq true
    end
  end

  context "Given a string without '#TODO'" do
    it "Returns false" do
      sentence = "Today I have to do something"
      expect(todo_checker(sentence)).to eq false
    end
  end
end