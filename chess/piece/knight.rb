require_relative "stepping_piece"
require_relative "piece"

class Knight < Piece
  include SteppingPiece

  def symbol
    :N
  end

  def move_diffs
    knight_dirs
  end

  def to_s
    "N"
  end

end
