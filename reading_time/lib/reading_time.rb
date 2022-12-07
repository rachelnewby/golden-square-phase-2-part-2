#def calculate_reading_time(words)
 # if words == " "
  #  return 0
  #end
  #calculate_time = (words.split(" ").length) / 200
  #return calculate_time.ceil
#end


def calculate_reading_time(words)
  return 0 if words == " "
  num_of_words = words.split(" ").length
  reading_time = num_of_words / 200.0 
  return reading_time.ceil if reading_time <= 1
  reading_time.round
end
