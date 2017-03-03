# number_of_pets = {
#   'dogs' => 2,
#   'cats' => 4,
#   'fish' => 1
# }
#
# types_of_pet = number_of_pets.keys
# counter = 0
#
# loop do
#   break if counter == types_of_pet.size
#   puts "I have #{number_of_pets[types_of_pet[counter]]} #{types_of_pet[counter]}."
#   counter += 1
# end

# numbers = []
# counter = 0
# while numbers.size < 5
#   numbers.push(rand(1...100))
#   puts numbers[counter]
#   counter += 1
# end
# counter -= 1
#
# until counter < 0
#   puts numbers[counter]
#   counter -= 1
# end

# for i in (1..25)
#   puts i if i % 2 == 1
#   puts i.odd?
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']
#
# for friend in friends
#   puts "Hello #{friend}"
# end

# count = 1
#
# loop do
#   even_or_odd = count.odd? ? 'odd' : 'even'
#   puts "#{count} is #{even_or_odd}!"
#   count += 1
#   break if count > 5
# end

# loop do
#   number = rand(100)
#   puts number
#   break if (1..10).cover?(number)
# end

process_the_loop = [true, false].sample

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   break if answer == 4
#   puts "Wrong answer, try again!"
# end
# puts "Good job!"

# numbers = []
#
# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers.push(input)
#   break if numbers.size >= 5
# end
# puts numbers

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# loop do
#   puts names.shift
#   break if names.empty?
# end

# 5.times do |index|
#   break if index == 2
#   puts index
# end

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2
# counter = 0
# while counter < 2
#   greeting
#   counter += 1
# end

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
# selected_chars = ''
# counter = 0
#
# loop do
#     current_char = alphabet[counter]
#
#     if current_char == 'g'
#       selected_chars.concat current_char
#     end
#
#     counter += 1
#     break if counter >= alphabet.length
# end
#
# puts selected_chars
#
# str = "Hello"
# str.concat(" world", 33)
# puts str
# str.clear

# def select_fruit(hash)
#   fruit_hash = {}
#   keys_arr = hash.keys
#   counter = 0
#
#   loop do
#     break if counter >= keys_arr.size # at top in case empty
#     if hash[keys_arr[counter]] == 'Fruit'
#       fruit_hash[keys_arr[counter]] = 'Fruit'
#     end
#
#     counter += 1
#   end
#   fruit_hash
# end
#
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0
#
#   loop do
#     break if counter == numbers.size
#
#     current_number = numbers[counter]
#     current_number *= 2 if counter.odd?
#     doubled_numbers << current_number
#
#     counter += 1
#   end
#
#   doubled_numbers
# end

# def multiply(collection, multiplier)
#   multiplied_collection = []
#   counter = 0
#
#   loop do
#     break if collection.size == counter
#     multiplied_collection << collection[counter] * multiplier
#
#     counter += 1
#   end
#   multiplied_collection
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
# hash.each defines a variable for the key and the value
# array.each defines a variable for the element
# both of them return the original collection
# select returns the element based on the truthyness of the last line in the block
# map replaces the element with whatever the last line of the block returns
# any will evaluate to true of any iteration evaluates to try (array and hash) enumerable, lazy iteration, stops as soon as it finds a true
# all will evaluate to true if all iterations evalute to true(array and hash) enumerable
# each_with_index on an array performs an operation and give access to the index as well
# each_with_index on a hash defines two variables, an array with the key value pair and an index
# each and each_with_index both return the original calling collection
#
# [1, 2, 3].each_with_object([]) do |num, array|
#   array << num if num.odd?
# end
# # => [1, 3]
my_array_container = []
[1, 2, 3, 4, 5].each_with_object(my_array_container) do |elem, container|
  container << elem if elem.odd?
end
p my_array_container
arr = []
{a: 'symbol a', b: 'symbol b', c: 'symbol c'}.each_with_object(arr) do |pair, container|
  container << pair
end
p arr

{a: 'symbol a', b: 'symbol b', c: 'symbol c'}.each_with_object(arr) do |(key, value), container| # can do this too
  container << pair
end

[1, 2, 3].first # => 1
[1, 2, 3].first(2) # => [1, 2]
{1 => 'hi', 2 => 'hello', 3 => 'hola'}.first(2) # => [[1, "hi"], [2, "hello"]]
# array.include?(3) returns true if array includes 3
# hash.include?(3) returns true if hash KEYS includes 3, doesn't check values
# hash.value?('value_here')
# hash.has_value?('value_here')
odd, even = [1, 2, 3, 4].partition do |num|
  num.odd?
end # returns [[1, 3], [2, 4]] but just [1, 3] and [2, 4] get assigned

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
