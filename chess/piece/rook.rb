require_relative "sliding_piece"
require_relative "piece"

class Rook < Piece
  include SlidingPiece

  def move_dirs
    horizontal_dirs
  end

  def symbol
    :R
  end

  def to_s
    "R"
  end
end
