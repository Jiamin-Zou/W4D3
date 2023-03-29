require_relative "piece.rb"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        '♛'.colorize(color)
    end

    private
    def move_dirs
        horizontal_dirs + vertical_dirs + diagonal_dirs
    end
end