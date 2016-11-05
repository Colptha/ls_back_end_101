def test(variable)
  puts "#{variable[0]} beginning test"
  test2(variable)
  puts "#{variable[0]} leaving test"
end

def test2(variable)
  puts "#{variable[0]} beginning test2"
  variable[0] = 2
  test3(variable)
  puts "#{variable[0]} leaving test2"
end

def test3(variable)
  puts "#{variable[0]} beginning test3"
  variable[0] = 3
  puts "#{variable[0]} leaving test3"
end

variable = [0]

puts "#{variable[0]} before method"

test(variable)

puts "#{variable[0]} after"