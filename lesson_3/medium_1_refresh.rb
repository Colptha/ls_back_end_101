# 30.times {|num| puts ("  " * num + "The Flintstones Rock!")}

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0 do
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   divisors
# end
#
# factors(0)

# limit = 25
#
# def fib(first_num, second_num, limit)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1, limit)
# puts "result is #{result}"

# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end
#
# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# answer = 42
#
# def mess_with_it(some_number)
#   some_number += 8
# end
#
# new_answer = mess_with_it(answer)
#
# p answer - 8
