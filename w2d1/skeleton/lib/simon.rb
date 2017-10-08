class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    reset_game
    game_over_message
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message if @game_over != true
    @sequence_length+= 1
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      p color
    end
  end

  def require_sequence
    p "Please enter the correct sequence"
    input = gets.chomp
    if input.split(" ") != @seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "Success!"
  end

  def game_over_message
    p "You have lost the game"
  end

  def reset_game
    @seq = []
    @game_over = false
    @sequence_length = 1
  end

end
