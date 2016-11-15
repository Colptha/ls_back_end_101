# 10.times { |number| puts "#{" " * number }The Flintstones Rock!" }

# statement = "The Flintstones Rock"
# letter_frequency = {}
# range = ('a'..'z').to_a + ('A'..'Z').to_a

# statement.each_char do |chr|
#   if letter_frequency.include?(chr)
#     letter_frequency[chr] += 1
#   elsif range.include?(chr)
#     letter_frequency[chr] = 1
#   end 
# end

# p letter_frequency

# statement = "The Flintstones Rock"
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end
# puts result

# letters = ('A'..'Z').to_a + ('a'..'z').to_a

# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# statement = "The Flintstones Rock!"
# result = {}
# scanning_criteria = ('A'..'Z').to_a + ('a'..'z').to_a

# scanning_criteria.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# puts "the value of 40 + 2 is " + "#{40 + 2}"
# puts "the value of 40 + 2 is " + (40 + 2).to_s

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# #1 3


# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
# #1 2

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0 do
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   divisors
# end

# p factors(-10)

# words = "the flintstones rock"

# # def titalize(words)
# #   words_array = words.split(" ")
# #   words_array = words_array.map { |str| str.capitalize }
# #   titalized_words = words_array.join(" ")
# # end
# def titalize(words)
#   words.split.map {|str| str.capitalize}.join(' ')
# end

# p titalize(words)

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
#Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

#hint: try using a case statement along with Ruby Range objects in your solution

munsters.each do |person, details|
  details["age_group"] = case details["age"]
                        when (0..17)
                          "kid"
                        when (18..64)
                          "adult"
                        else
                          "senior"
                        end
end

p munsters