require "colorize"
require_relative "cursor.rb"
class Display
  attr_reader :board, :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    puts "  0 1 2 3 4 5 6 7"
    board.grid.each_with_index do |row, i|
      string_row = row.map.with_index do |el, j|
        if cursor.cursor_pos == [i,j]
          el.to_s.colorize(:background => :light_yellow)
        else
          el.to_s
        end
      end
      puts "#{i} #{string_row.join(" ")}"
    end
  end

  def make_move
    while true
      system("clear")
      render
      movement = cursor.get_input
      break if movement.is_a?(Array)
    end
  end

end
