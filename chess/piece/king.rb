require_relative "stepping_piece"
require_relative "piece"

class King < Piece
  include SteppingPiece

  def symbol
    :K
  end

  def move_diffs
    king_dirs
  end

  def to_s
    "K"
  end
end
