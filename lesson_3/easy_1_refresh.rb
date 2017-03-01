# numbers = [1, 2, 2, 3]
# puts numbers.uniq
# puts numbers
# p numbers
# puts numbers.inspect
# print numbers.inspect

# advice = "Few things in life are as important as house training your pet dinosaur."
# puts advice.gsub('important', 'urgent')

# array = [1, 2, 3, 4].delete_at(3)
# p array # => 4
#
# p (0..100).include?(42)
# p (0..100).include?(100)
# p (0..100).include?(0)
# p (0..100).include?(45.1)
# p (10..100).cover?(42) # inclusive
# p (100).between?(10, 100) # inclusive
# p (10..100).cover?('a')
# array_inclusive = ('a'..'z').to_a
# array_exclusive = ('a'...'z').to_a
# p array_inclusive
# p array_exclusive

# famous_words = "seven years ago..."
# famous_words.prepend('Four score and ')
# p famous_words
#
# famous_words = "seven years ago..."
# famous_words = (famous_words.reverse + ('Four score and ').reverse).reverse
# p famous_words
#
# shovel = "Time "
# shovel << 'to learn again!'
# p shovel

# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# p flintstones
# flintstones.flatten!
# p flintstones

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# p flintstones.select {|person| person == "Barney"}.to_a.flatten
# p flintstones.assoc("Barney")
