require_relative "piece.rb"

class Knight < Piece
    include Stepable

    def symbol
        '♞'.colorize(color)
    end

    protected
    def move_diffs
        MOVE_DIFFS = [
            [-2, -1],
            [-2, 1],
            [2, 1],
            [2, -1],
            [1, 2],
            [1, -2],
            [-1, -2],
            [-1, 2]
    ].freeze
    end

end