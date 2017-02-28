def test(variable)
  puts "#{variable[0]} beginning test" # 0
  test2(variable)
  puts "#{variable[0]} leaving test" # 3
end

def test2(variable)
  puts "#{variable[0]} beginning test2" # 0
  variable[0] = 2
  test3(variable)
  puts "#{variable[0]} leaving test2" # 3
end

def test3(variable)
  puts "#{variable[0]} beginning test3" # 2
  variable[0] = 3
  puts "#{variable[0]} leaving test3" # 3
end

variable = [0]

puts "#{variable[0]} before method" # 0

test(variable)
# 0 0 2 3 3 3 3

puts "#{variable[0]} after"
