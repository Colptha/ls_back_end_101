
require 'yaml'
require 'pry'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['greet'] + "#{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end

  prompt(MESSAGES[operator])

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt(MESSAGES['result'] + result.to_s)

  prompt(MESSAGES['repeat'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['exit'])
