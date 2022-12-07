require_relative '../lib/reading_time'

describe "calculate reading time" do
  it "returns zero when an empty string is passed" do
    words = " "
    expect(calculate_reading_time(words)).to eq 0
  end

  it "returns 1 when 'one' passed in" do
    words = "one"
    expect(calculate_reading_time(words)).to eq 1
  end

  it "returns 1 when two hundred words are passed in" do
    words = ("word " * 200)
    expect(calculate_reading_time(words)).to eq 1
  end

  it "returns 2 when three hundred words are passed in" do
    words = ("words " * 300)
    expect(calculate_reading_time(words)).to eq 2
  end

  it "returns 25 when five thousands words are in" do
    words = ("word " * 5000)
    expect(calculate_reading_time(words)).to eq 25
  end
end