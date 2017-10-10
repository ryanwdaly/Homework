class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {[]}
    place_stones


  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      unless i == 6 || i == 13
        4.times{ @cups[i] << :stone }
      end
    end
  end

  def valid_move?(start_pos)
   if start_pos == 15 || start_pos == 0
     raise "Invalid starting cup"
   end
    true
  end

  def make_move(start_pos, current_player_name)
    player = current_player_name
    stones = cups[start_pos]
    @cups[start_pos] = []

    index = start_pos
    until stones.empty?
      index += 1
      index = 0 if index == 14

      if index == 6
          @cups[index] << stones.shift if player == @player1
      elsif index == 13
        @cups[index] << stones.shift if player == @player2
      else
        @cups[index] << stones.shift
      end
    end

    render
    next_turn(index)


  end



  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
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
    if @cups[0..5].all?{ |cup| cup.empty? }
      true
    elsif @cups[7..12].all?{ |cup| cup.empty? }
      true
    else
      false
    end
  end

  def winner
    player1_score = @cups[6].count


    player2_score = @cups[13].count


    return :draw if player1_score == player2_score

    player1_score > player2_score ? @player1 : @player2


  end
end
