require_relative "piece.rb"

class King < Piece
    include Stepable

    def symbol
        '♚'.colorize(color)
    end

    protected
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
    ].freeze
    end
end
