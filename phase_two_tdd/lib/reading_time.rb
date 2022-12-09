def calculate_reading_time(words)
  return 0 if words == " "
  num_of_words = words.split(" ").length
  reading_time = num_of_words / 200.0 
  return reading_time.ceil if reading_time <= 1
  reading_time.round
end

=begin
def calculate_reading_time(words)
  return 0 if words == " "
  num_of_words = words.split(" ").length
  reading_time = num_of_words / 200.0 
  #return "#{reading_time.ceil} minutes" #if reading_time <= 1
  #"#{reading_time.round} minutes"
  if reading_time > 60
    "#{(reading_time.ceil / 60)} hours and #{(reading_time.ceil % 60)} minutes"
  else 
    reading_time.ceil"
  end 
end

def file_reading_time
  file_name = ARGV.first
  file = File.read(file_name)
  puts calculate_reading_time(file)
end

#file_reading_time
=end