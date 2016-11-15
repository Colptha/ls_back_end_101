# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# puts ages["Spot"]
# puts ages.include? "Spot"
# puts ages.key? "Spot"
# puts ages.member? "Spot"

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# total_age = 0
# ages.each_value {|age| total_age += age}
# puts total_age
# puts ages.values.reduce(:+)

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# # p ages.values.reject {|i| i >= 100}
# p ages.keep_if { |_, age| age < 100}
# p ages

# munsters_description = "The Munsters are creepy in a good way."

# puts munsters_description.upcase
# puts munsters_description.downcase
# puts munsters_description.capitalize
# puts munsters_description.swapcase

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# p ages.merge!(additional_ages)
# p ages.values.min

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.include? "Dino"
# p advice.include? "dino"
# p advice.match

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones.index { |name| name[0...2] == "Be" }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0..2] }
p flintstones