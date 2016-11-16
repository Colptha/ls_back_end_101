# # original
# def create_uuid
#   hex_value = ('0'..'9').to_a + ('a'..'f').to_a
#   uuid = []
#   32.times do |_|
#     uuid << hex_value.sample
#   end
#   uuid.insert(20, '-').insert(16, '-').insert(12, '-').insert(8, '-').join
# end

# puts create_uuid

# # launch
# def generate_UUID
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end

# puts generate_UUID

# def create_uuid_refactor
#   hex_value = ('0'..'9').to_a + ('a'..'f').to_a
#   uuid = []
#   32.times do |_|
#     uuid << hex_value.sample
#   end
#   uuid.insert(20, '-').insert(16, '-').insert(12, '-').insert(8, '-').join
# end

# original

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false if dot_separated_words.count != 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     next if is_an_ip_number?(word)
#     return false
#   end
#   true
# end

# launch

# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end

#   true
# end