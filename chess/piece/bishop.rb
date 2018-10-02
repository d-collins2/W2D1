require_relative "sliding_piece"
require_relative "piece"

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    diagonal_dirs
  end

  def symbol
    :B
  end

  def to_s
    "B"
  end
end
