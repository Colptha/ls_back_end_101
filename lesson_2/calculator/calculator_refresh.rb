require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(message, pre_message = '', post_message = '')
  message = MESSAGES[LANGUAGE][message]
  print "=>"
  print pre_message
  print message
  print post_message
end

def ask_name
  name = ''
  loop do
    name = Kernel.gets().chomp()

    break unless name.empty?()
    prompt('valid_name')
  end

  name
end

def valid_number?(num)
  /^[0-9]+.?[0-9]*$/ =~ num || /^.[0-9]+$/ =~ num
end

def ask_number(message)
  number = ''
  loop do
    prompt(message)
    number = Kernel.gets().chomp()

    break if valid_number?(number)
    prompt('valid_number')
  end

  number
end

def ask_operator
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    # return operator if %w(1 2 3 4).include?(operator)
    break if %w(1 2 3 4).include?(operator)
    prompt('valid_operator')
  end

  operator
end

def result(number1, operator, number2)
  case operator
  when '1'
    number1.to_f() + number2.to_f()
  when '2'
    number1.to_f() - number2.to_f()
  when '3'
    number1.to_f() * number2.to_f()
  when '4'
    number1.to_f() / number2.to_f()
  end
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

def repeat
  answer = ''

  loop do
    prompt('repeat')
    answer = Kernel.gets().chomp().downcase()
    break if %w(y yes yeah sure n no nope).include?(answer)
  end

  answer
end

def repeat?(answer)
  %w(yes y yeah sure).include?(answer)
end

prompt('welcome')

name = ask_name

prompt('greet', name)

loop do
  number1 = ask_number('first_number')
  number2 = ask_number('second_number')

  prompt('operator_prompt')

  operator = ask_operator

  prompt('', "#{operation_to_message(operator)} the two numbers...")

  result = result(number1, operator, number2)

  prompt('result', result.to_s)

  break unless repeat?(repeat)
end

prompt('exit')
