require_relative "piece.rb"

class King < Piece
    def symbol
        '♚'.colorize(color)
    end

    Protected
    def move_diffs
        MOVE_DIFFS = [
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, -1],
            [0, 1],
            [1, -1],
            [1, 0],
            [1, 1]
        ]
    end
end
