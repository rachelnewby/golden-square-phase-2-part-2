#def calculate_reading_time(words)
 # if words == " "
  #  return 0
  #end
  #calculate_time = (words.split(" ").length) / 200
  #return calculate_time.ceil
#end


def calculate_reading_time(words)
  if words == " "
    return 0
  elsif words.include?(" ")
    num_of_words = words.split(" ").length
 #else
  #  num_of_words = 1
  end
  if num_of_words = [1..200]
    return 1
  elsif num_of_words = [201..300]
    return 2
  end
#  calculate_time = (words.split(" ").length) / 200
#  return calculate_time.ceil
end
