require 'byebug'

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

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence

    if require_sequence != @seq
      @game_over = true
    end

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    system("clear")
    p "Get ready..."
    sleep 1.25
    system("clear")

    @seq.each do |color|

      p color
      sleep 0.9
      system("clear")
      sleep 0.1
    end
  end

  def require_sequence
    guess_sequence = []

    while guess_sequence.length < @sequence_length
      p "Input Color #{guess_sequence.length + 1}:"
      color_input = gets.chomp

      # debugger
      until COLORS.include?(color_input.downcase)
        p "Color does not exist"
        p "Valid colors are: #{COLORS}"
        color_input = gets.chomp
      end

      guess_sequence << color_input
    end

    guess_sequence
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    p "successful round"
  end

  def game_over_message
    p "game over"
    if @sequence_length > 30
      p "You're disgusting"
    elsif @sequence_length > 20
      p "Congrats, yer not so bad."
    else
      p "work on your rhythmemory"
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
