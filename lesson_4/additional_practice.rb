# # turn into hash where names are keys and indices are values
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# counter = 0
#
# flintstones_hash = flintstones.map do |element|
#   nested_element = [element, counter]
#   counter += 1
#   nested_element
# end.to_h
#
# p flintstones_hash
#
# flintstones_hash_two = {}
# flintstones.each_with_index do |el, index|
#   flintstones_hash_two[el] = index
# end
#
# p flintstones_hash_two


# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.sum


# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.reject! {|person, age| age > 100}
# p ages

#
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.min

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# p flintstones.bsearch_index {|name| name[0, 2] == 'Be'}

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles).map! {|name| name[0,3]}
# p flintstones

# statement = "The Flintstones Rock"
# flint_hash = {}
# statement.size.times do |num|
#   if flint_hash[statement[num - 1]] == nil
#     flint_hash[statement[num - 1]] = 1
#   else
#     flint_hash[statement[num - 1]] += 1
#   end
# end
# p flint_hash
#
# flint_hash_2 = {}
# search_criteria = ('A'..'Z').to_a + ('a'..'z').to_a
# search_criteria.each do |letter|
#   total = statement.scan(letter).count
#   if total > 0
#     flint_hash_2[letter] = total
#   end
# end
# p flint_hash_2

# words = "the flintstones rock"
# words_arr = words.split.map {|word| word.capitalize!}.join(' ')
# p words_arr

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
} # Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munster_mod = munsters.map do |person, data_hash|
  if (0..17).cover?(data_hash['age'])
    data_hash['age_group'] = 'kid'
  elsif (18..64).cover?(data_hash['age'])
    data_hash['age_group'] = 'adult'
  else
    data_hash['age_group'] = 'senior'
  end

  [person, data_hash]
end.to_h

p munster_mod

munsters.each do |person, data_hash|
  case data_hash['age']
  when 0..17
    data_hash['age_group'] = 'kid'
  when 18..64
    data_hash['age_group'] = 'adult'
  else
    data_hash['age_group'] = 'senior'
  end
end
