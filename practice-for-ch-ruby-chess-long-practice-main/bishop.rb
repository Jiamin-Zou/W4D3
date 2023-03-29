require_relative "piece.rb"

class Bishop < Piece
    def symbol
        '♝'.colorize(color)
    end
end