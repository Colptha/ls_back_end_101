# Replace 'important' with 'urgent'
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
puts advice

puts (10..100).include?(42)

famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
p flintstones
flintstones.flatten!
p flintstones

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
barney = flintstones.assoc("Barney")
p flintstones
p barney

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
counter = 0
flintstones.each do |name|
  flintstones_hash[name] = counter
  counter += 1
  end
p flintstones_hash