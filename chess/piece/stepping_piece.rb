module SteppingPiece

  def move_diffs
    king_dirs + knight_dirs
  end

  def moves
    move_array = []
    move_diffs.each do |dir|
      next_pos = [self.pos.first + dir.first, self.pos.last + dir.last]
      target_position = self.board[next_pos]
      if target_position.is_a?(NullPiece) || target_position.color == self.color
        move_array << next_pos
      end
    end
    move_array
  end

  def knight_dirs
    [[1,2], [2,1], [-1,2], [-2,1], [-1,-2], [-2,-1], [1,-2], [2,-1]]
  end

  def king_dirs
    [[0,1],[1,0],[-1,0],[0,-1],[1,1], [1,-1], [-1,1], [-1,-1]]
  end

end
