require_relative "piece.rb"

class Knight < Piece
    def symbol
        '♞'.colorize(color)
    end
end