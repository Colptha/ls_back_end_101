# m = p * (j / (1 - (1 + j)**-n))
# m = monthly payment
# p = loan amount
# j = monthly interest Rate
# n = loan duration in months
require 'pry'
# methods

def prompt(message)
  puts "=> #{message}"
end

# validation methods
def valid_string?(string)
  string != ""
end

def valid_number?(num)
  (num.to_f.to_s == num || num.to_i.to_s == num) &&
    num.to_f >= 0
end

def valid_yes_no?(yes_no)
  (
    (yes_no == 'y' || yes_no == 'yes') ||
    (yes_no == 'n' || yes_no == 'no')
  )
end

# validated input methods
def input_valid_name
  user_name = nil
  loop do
    prompt "What is your name?"
    user_name = gets.chomp
    break if valid_string?(user_name)
    prompt "Please enter a name."
  end
  user_name
end

def input_valid_principal
  principal = nil
  loop do
    principal = gets.chomp
    break if valid_number?(principal)
    prompt "Please enter a number greater than zero."
  end
  principal
end

def input_valid_duration
  duration = nil
  loop do
    duration = gets.chomp.split(", ")
    break if valid_number?(duration[0]) && valid_number?(duration[1])
    prompt "Please enter numbers in (years, months) format."
  end
  duration
end

def input_valid_apr
  apr = nil
  loop do
    apr = gets.chomp
    break if valid_number?(apr)
    prompt "Please enter a valid APR."
  end
  apr
end

def input_valid_rerun?
  rerun = nil
  loop do
    prompt "Would you like to estimate another payment? (Y/N)"
    rerun = gets.chomp.downcase
    break if valid_yes_no?(rerun)
  end
  rerun
end

# process method
def compute_monthly_pay(principal, loan_months, monthly_interest)
  if loan_months == 0.0
    principal
  elsif monthly_interest == 0.0
    principal / loan_months
  else
    (principal * (monthly_interest /
           (1 - (1 + monthly_interest)**-loan_months)))
  end
end

# Program start below

prompt "Welcome to loan calculator!"

user_name = input_valid_name

loop do # main loop
  prompt "#{user_name}, how much money are you looking to borrow?"
  principal = input_valid_principal.to_f

  prompt "What loan term is desired?"
  prompt "Please enter (years, months)"
  prompt "Example: 2, 6"
  duration = input_valid_duration
  loan_months = (duration[0].to_f * 12) + duration[1].to_f

  prompt "What is the loan's APR?"
  prompt "(If 5% then enter 5.)"
  apr = input_valid_apr.to_f
  monthly_interest = (apr / 12) / 100

  monthly_pay = compute_monthly_pay(principal, loan_months, monthly_interest)

  prompt "Your monthly payment is $#{format('%02.2f', monthly_pay)}."
  rerun = input_valid_rerun?
  break unless rerun == 'y' || rerun == 'yes'
end # end main loop

prompt "Thank you for using Loan Calculator!"
