require_relative "piece.rb"

class Queen < Piece
    def symbol
        '♛'.colorize(color)
    end
end