require 'byebug'

module SlidingPiece
  HORIZONTAL_DIRS = [[1,0], [-1,0], [0,-1], [0,1]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    # debugger
    move_array = []
    move_dirs.each do |dir|
      next_pos = [self.pos.first + dir.first, self.pos.last + dir.last]
      while self.board[next_pos].is_a?(NullPiece)
        break unless board.valid_pos?(next_pos)
        move_array << next_pos
        next_pos = [next_pos.first + dir.first, next_pos.last + dir.last]
      end
    end
    move_array
  end
end
