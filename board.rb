require 'pry'

class Square

  attr_accessor :value, :parent, :children

  def initialize (value, parent=nil)
    @value = value
    @children = []
    @parent = parent
  end
end


class Board
  attr_accessor :moves_tree

  def initialize
    @moves_tree = nil
  end

  def start_position(position)
    @moves_tree = Square.new(position)
  end

  def look_for_destination_square(destination)
    look_for_destination_square_aux([moves_tree], destination)
  end

  def find_path(current_square)
    return [current_square.value] if current_square.parent.nil?
    path = find_path(current_square.parent)
    path << current_square.value
    return path
  end

  private

  def build_square_children(current_square)
    x = current_square.value[0]
    y = current_square.value[1]
    possible_positions = [
      [x + 2, y - 1],
      [x + 2, y + 1],
      [x - 2, y - 1],
      [x - 2, y + 1],
      [x + 1, y - 2],
      [x + 1, y + 2],
      [x - 1, y - 2],
      [x - 1, y + 2],
    ]
    valid_positions = get_valid_positions(possible_positions)
    current_square.children = build_squares(valid_positions, current_square)
  end

  def get_valid_positions(positions_array)
    positions_array.select { |ary| ary.all? { |el| el >= 0  && el < 8 } }
  end

  def build_squares(valid_positions, current_square)
    valid_positions.map do |square|
      Square.new(square, current_square)
    end
  end

  def look_for_destination_square_aux(queue, destination)
    current_square = queue.shift
    return current_square if current_square.value == destination
    queue += build_square_children(current_square)
    look_for_destination_square_aux(queue, destination)
  end
end
