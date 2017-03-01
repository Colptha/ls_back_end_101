# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.select {|spot| spot == "Spot"}
# p ages.assoc("Spot")
# p ages.value?("Spot")
# p ages.key?("Spot")
# p ages.include?("Spot")
# p ages.member?("Spot")

# munsters_description = "The Munsters are creepy in a good way."
#
# puts munsters_description.capitalize
# puts munsters_description.swapcase
# puts munsters_description.downcase
# puts munsters_description.upcase

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
#
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# ages.merge!(additional_ages)
# p ages

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.include?('dino')
# p advice.match('dino')

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones << 'Dino'
#
# flintstones.concat(['Concat'])
# flintstones.push('Push')
# flintstones.insert(-1, 'Tom', 'Dick', 'Harry')
# p flintstones

# advice = "Few things in life are as important as house training your pet house dinosaur."
# left_overs = advice.slice!(/house.*/) # only slices first one
# p advice
# p left_overs

statement = "The Flintstones Rock!"
p statement.count 't'
