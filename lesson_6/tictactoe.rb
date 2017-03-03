require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word ='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if two_of_three(brd, COMPUTER_MARKER)
             two_of_three(brd, COMPUTER_MARKER)
           elsif two_of_three(brd, PLAYER_MARKER)
             two_of_three(brd, PLAYER_MARKER)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def two_of_three(brd, marker_check)
  WINNING_LINES.each do |line|
    next unless brd.values_at(*line).count(marker_check) == 2 &&
                brd.values_at(*line).count(INITIAL_MARKER) == 1
    square = brd.select do |space, marker|
      line.include?(space) && marker == INITIAL_MARKER
    end.key(INITIAL_MARKER)
    return square
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def five_wins?(score)
  !!score.key(5)
end

def display_winner(score)
  prompt score.key(5) + " is first to five wins!"
end

def display_score(score)
  prompt "Player: #{score['Player']}, Computer: #{score['Computer']}"
end

def valid_player?(player)
  player == 'computer' || player == 'player'
end

def determine_first_player
  first_player = nil
  while first_player.nil?
    prompt "Who should go first? (player, computer)"
    answer = gets.chomp.downcase
    first_player = answer if valid_player?(answer)
    prompt "Please enter 'player' or 'computer'" if first_player.nil?
  end
  first_player
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

def replay?
  answer = nil
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
  end
  answer
end

loop do # program loop
  current_player = determine_first_player

  score = { 'Player' => 0, 'Computer' => 0 }

  loop do # 5 game loop
    board = initialize_board

    loop do # current game
      display_board(board)
      display_score(score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end # end of current game

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      score[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
    end
    sleep 2

    break if five_wins?(score)
  end # end of 5 game loop
  display_winner(score)

  break unless replay? == 'y'
end # end of program loop

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
