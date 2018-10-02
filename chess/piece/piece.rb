class Piece
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves

  end

  def pos=(value)

  end

  def to_s
    "x"
  end

  def symbol

  end

  def empty?
    false
  end
end
