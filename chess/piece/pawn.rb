require_relative "piece"

class Pawn < Piece
  def symbol
    :*
  end

  def to_s
    "*"
  end

  def move_dirs
    forward_steps + side_attacks
  end

  def at_start_row?
    return true if self.color == :red && self.pos.first == 1
    return true if self.color == :blue && self.pos.first == 6
    false
  end

  def forward_dir
    if self.color == :red
      1
    else
      -1
    end
  end

  def side_attacks
    moves = []
    if forward_dir == 1
      moves << adj_pos([1,-1]) if board[adj_pos([1,-1])].color == :blue
      moves << adj_pos([1,1]) if board[adj_pos([1,1])].color == :blue
    else
      moves << adj_pos([-1,-1]) if board[adj_pos([-1,-1])].color == :red
      moves << adj_pos([-1,1]) if board[adj_pos([-1,1])].color == :red
    end
    moves
  end

  def adj_pos(inc)
    [self.pos.first + inc.first, self.pos.last + inc.last]
  end

  def forward_steps
    moves = []
    update_moves([forward_dir,0], moves)
    if at_start_row?
      update_moves([forward_dir+1,0], moves)
    end
    moves
  end

  def update_moves(inc, moves_arr)
    next_pos = adj_pos(inc)
    if board[next_pos].color != self.color
      moves_arr << next_pos
    end
  end

end
