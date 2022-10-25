class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0...@cups.length).each do |i|
      unless i == 6 || i == 13
        @cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0,5) || start_pos.between?(7,12)
      raise 'Invalid starting cup'
    end
    raise 'Starting cup is empty' if @cups[start_pos].empty?

    true
  end

  def make_move(start_pos, current_player_name)
    current_player_name == @name1 ? opponent_store = 13 : opponent_store = 7
    starting_cup = @cups[start_pos]

    until starting_cup.empty?
      start_pos = (start_pos + 1) % @cups.length
      unless opponent_store == start_pos
        @cups[start_pos] << starting_cup.pop
      end
    end
    
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if [6, 13].include?(ending_cup_idx)
      :prompt
    elsif @cups[ending_cup_idx].length == 1
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
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner  
    case @cups[6] <=> @cups[13]
    when 1
      return @name1
    when 0
      return :draw
    when -1
      return @name2
    end
  end
end
