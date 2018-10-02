require_relative "sliding_piece"
require_relative "piece"

class Queen < Piece
  include SlidingPiece

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def symbol
    :Q
  end

  def to_s
    "Q"
  end
end
