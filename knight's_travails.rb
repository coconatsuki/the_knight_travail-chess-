
class Knight_moves

  def initialize
    @board = []
  end

  0.upto(7) { |x| 0.upto(7) {|y| board << [x, y] } }

  print board


end


possible moves = [[x + 2, y - 1], [x + 2, y + 1], [x - 2, y - 1], [x - 2, y + 1],
[x + 1, y - 2], [x + 1, y + 2], [x - 1, y - 2], [x - 1, y + 2]]
