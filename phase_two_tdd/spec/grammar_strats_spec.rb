require 'grammar_strats'

describe GrammarStats do
  describe "#check method" do
    it "returns true when string has capital letter at beginning and punctuation mark at end" do
      grammar = GrammarStats.new
      word = "Hello!"
      expect(grammar.check(word)).to eq true
    end

    it "returns false when string has no capital letter at beginning but has punctuation at end" do
      grammar = GrammarStats.new
      word = "hello!"
      expect(grammar.check(word)).to eq false
    end

    it "returns false when string has capital letter at beginning but no punctuation at end" do
      grammar = GrammarStats.new
      word = "Hello"
      expect(grammar.check(word)).to eq false
    end

    it "returns false when string has neither capital nor punctuation" do
      grammar = GrammarStats.new
      word = "hello"
      expect(grammar.check(word)).to eq false
    end

    it "fails when a non string is entered" do
      grammar = GrammarStats.new
      expect { grammar.check(1234) }.to raise_error "Check method can only review string input"
    end
  end

  describe "#percentage_good" do
    context "when one string has been passed to #check method" do
      it "returns 100 when string is true" do
        grammar = GrammarStats.new
        word = "Hello!"
        grammar.check(word)
        expect(grammar.percentage_good).to eq 100
      end
      it "returns 0 when string is false" do
        grammar = GrammarStats.new
        word = "hello!"
        grammar.check(word)
        expect(grammar.percentage_good).to eq 0
      end
    end

    context "when two strings have been passed to #check method" do
      it "returns 100 when both strings are true" do
        grammar = GrammarStats.new
        grammar.check("Hello!")
        grammar.check("Goodbye.")
        expect(grammar.percentage_good).to eq 100
      end

      it "returns 50 when one string is false and one is true" do
        grammar = GrammarStats.new
        grammar.check("Hello!")
        grammar.check("goodbye.")
        expect(grammar.percentage_good).to eq 50
      end
    end

    context "when the check method hasn't been called and there is no percentage to display" do
      it "returns an error message" do
        grammar = GrammarStats.new
        expect(grammar.percentage_good).to eq "Error, no sentences have been checked"
      end
    end

    context "when 9 strings have been tested" do
      it "returns 55 when 5 are true" do
        grammar = GrammarStats.new
        grammar.check("Hello!")
        grammar.check("Yes, hello!")
        grammar.check("Hello Mr. Man!")
        grammar.check("Hello sailor!")
        grammar.check("goodbye.")
        grammar.check("goodbye.")
        grammar.check("Oi")
        grammar.check("do one.")
        grammar.check("Often we go to the seaside!")
        expect(grammar.percentage_good).to eq 55
      end

      it "returns 44 when 4 are true" do
        grammar = GrammarStats.new
        grammar.check("Hello!")
        grammar.check("Yes, hello!")
        grammar.check("Hello Mr. Man")
        grammar.check("Hello sailor!")
        grammar.check("goodbye.")
        grammar.check("goodbye.")
        grammar.check("Oi")
        grammar.check("do one.")
        grammar.check("Often we go to the seaside!")
        expect(grammar.percentage_good).to eq 44
      end

      it "returns 77 when 7 are true" do
        grammar = GrammarStats.new
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("Hello!")
        grammar.check("do one.")
        grammar.check("do one.")
        expect(grammar.percentage_good).to eq 77
      end
    end
  end
end