class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup,i|
      if i != 13 && i!= 6
        4.times {cup << :stone}
      end
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos <= 0 || start_pos >= 13 || start_pos == 6
    true
  end

  def make_move(start_pos, current_player_name)

    if current_player_name == @name1
      invalid_cup = 13
    elsif current_player_name == @name2
      invalid_cup = 6
    end

    number = @cups[start_pos].length
    @cups[start_pos] = []
    i = 1
    while i <= number
      if (start_pos + i) % 14 == invalid_cup
          number+= 1
          i+= 1
          @cups[(start_pos + i) % 14] << :stone
      else
        @cups[(start_pos + i) % 14] << :stone
      end
      i+= 1
    end
    self.render
    final_pos = (start_pos + number) % 14
    next_move = next_turn(final_pos)

    if next_move == :switch
      :switch
    elsif next_move == :prompt && final_pos == 6 || final_pos == 13
      :prompt
    else
      final_pos
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].length <= 1 && ending_cup_idx != 6 && ending_cup_idx != 13
      :switch
    else
      :prompt
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    first_row = @cups[0..5].all? {|cup| cup.empty?}
    second_row = @cups[7..12].all? {|cup| cup.empty?}
    return true if first_row == true || second_row == true
    false
  end

  def winner
    compare_winner = @cups[13].length <=> @cups[6].length
    case compare_winner
    when 1
      @name2
    when 0
      :draw
    when -1
      @name1
    end
  end
end
