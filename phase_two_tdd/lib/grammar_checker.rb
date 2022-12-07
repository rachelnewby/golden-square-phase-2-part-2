def grammar_checker(sentence)
  fail("Wrong data type") unless sentence.is_a?(String)
  first_letter = sentence[0]
  starts_with_cap = first_letter.upcase == first_letter
  last_char = sentence[-1]
  ends_with_punc = ["!", "?", "."].include?(last_char)
  
  if !(starts_with_cap || ends_with_punc)
    return "No capital letter or punctuation"
  elsif !starts_with_cap
    return "No capital letter"
  elsif !ends_with_punc
    return "No punctuation"
  else
    return "Passed checks"
  end
end