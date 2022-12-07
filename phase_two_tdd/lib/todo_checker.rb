def todo_checker(string)
  fail "Error, wrong data input" unless string.is_a?(String)
  string.include?('#TODO')
end