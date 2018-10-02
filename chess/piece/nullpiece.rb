require "singleton"

class NullPiece < Piece
  include Singleton

  attr_reader :color, :symbol
  def initialize

  end

  def symbol
    nil
  end

  def empty?
    true
  end

  def to_s
    " "
  end
end
