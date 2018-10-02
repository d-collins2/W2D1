require_relative "piece"
require 'byebug'

class PositionError < StandardError; end

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8){[]} #[[piece, piece, piece...], [], ...]
    piece_row = [0,1,6,7]
    @sentinel = NullPiece.instance
    grid.each_with_index do |row, n|
      if piece_row.include?(n)
        8.times {row << Piece.new}
      else
        8.times {row << @sentinel}
      end
    end
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  # def ==(value)
  #   self == value
  # end

  def move_piece(start_pos, end_pos)

    raise PositionError if self[start_pos] == @sentinel
    raise PositionError unless valid_move?(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil

  end

  def valid_move?(start_pos, end_pos)
    self[end_pos].nil?
  end

  def valid_pos?(pos)
    if pos.first < 0 || pos.first > 7 || pos.last < 0 || pos.last > 7
      return false
    end
    true
  end

end
