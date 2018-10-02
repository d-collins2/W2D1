load 'board.rb'
load 'piece/rook.rb'
load 'piece/queen.rb'
load 'piece/bishop.rb'
load 'piece/king.rb'
load 'piece/knight.rb'
load 'piece/pawn.rb'
load 'display.rb'

b = Board.new
d = Display.new(b)
d.render

# r = Pawn.new(:blue,b,[2,4])
# b[[2,4]] = r
# r.move_dirs
