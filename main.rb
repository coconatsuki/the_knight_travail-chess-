require './board'

class Main

  def initialize
    @board = Board.new
  end

  def knight_moves(position, destination)
    @board.start_position(position)
    destination_square = @board.look_for_destination_square(destination)
    path = @board.find_path(destination_square)
    puts "You made it in #{path.size} moves ! Here's your path :"
    path.each { |value| puts "#{value} " }
  end
end

main = Main.new
main.knight_moves([0, 0], [6, 2])
