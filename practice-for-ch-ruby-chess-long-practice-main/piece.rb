class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end
end