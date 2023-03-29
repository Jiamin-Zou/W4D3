class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def to_s
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(value)
    end

    def Symbol
    end

    Private
    def move_into_check?(end_pos)
    end
end