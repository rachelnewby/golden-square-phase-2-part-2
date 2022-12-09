class GrammarStats
  def initialize
    @initialize
    @checks_run = []
  end

  def check(text)
    fail("Check method can only review string input") unless text.is_a?(String)
    punctuation_array = ["!", ".", "?"]
    result = text[0] == text[0].upcase && punctuation_array.include?(text[-1])
    @checks_run.push(result)
    return result
  end

  def percentage_good
    return "Error, no sentences have been checked" if @checks_run.length == 0
    number_of_true = @checks_run.count(true)
    result = (number_of_true.to_f / @checks_run.length) * 100
    return result.to_i
  end
end

