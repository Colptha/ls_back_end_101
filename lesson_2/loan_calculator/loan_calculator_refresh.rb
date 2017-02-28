require 'pry'
def prompt(message)
  puts "=> #{message}"
end

prompt 'Welcome to loan calculator!'
principal = ''
loop do
  prompt 'Enter loan amount'
  principal = gets.chomp
  break if principal.to_i > 0
  prompt 'Please enter a positive integer'
end
principal = principal.to_i

is_months = false
loop do
  prompt 'Is loan duration in years or months?'
  response = gets.chomp.downcase
  break if response.match?(/year/)
  break if is_months = response.match?(/month/)
end

duration = ''
loop do
  prompt 'Enter duration of loan'
  duration = gets.chomp
  break if duration.match?(/^\d+$/)
  prompt 'Please enter a valid integer'
end
duration = duration.to_i

apr = ''
loop do
  prompt 'Enter APR of loan'
  apr = gets.chomp
  break if apr.match?(/^\d+.?\d*$/) || apr.match?(/^\d*.\d+/)
end
monthly_interest = apr.to_f / 100 / 12

months_duration = is_months ? duration : duration * 12

monthly_payment = principal * (monthly_interest /
                  (1 - (1 + monthly_interest)**-months_duration))

prompt(format("Your monthly payment will be %.02f", monthly_payment))
