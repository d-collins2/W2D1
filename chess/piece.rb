require "singleton"
class Piece
  def to_s
    "x"
  end
end

class NullPiece < Piece
  include Singleton
  def to_s
    " "
  end
end
