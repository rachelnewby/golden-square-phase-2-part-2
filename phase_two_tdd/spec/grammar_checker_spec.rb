require "grammar_checker"

RSpec.describe "testing grammar_checker method" do
  context "wrong data type" do
    it "raises error message" do
      expect { grammar_checker(1234) }.to raise_error "Wrong data type"
    end
  end
  
  context "No capital letter but proper punctation" do
    it "prints string informing no capital" do
      expect(grammar_checker("hi.")).to eq "No capital letter"
    end
  end
  
  context "Capital letter but no punctation" do
    it "prints string informing no punctation" do
      expect(grammar_checker("Hi")).to eq "No punctuation"
    end
  end
  
  context "No captital and no punctation" do
    it "prints string informing about both" do
      expect(grammar_checker("hi")).to eq "No capital letter or punctuation"
    end
  end
end