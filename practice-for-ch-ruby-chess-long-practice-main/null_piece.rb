require_relative "piece.rb"

class NullPiece < Piece
    include "Singleton"
    attr_reader :color, :symbol
    def initialize
        @color = nil
    end

    def moves
        raise "You cannot move NullPieces"
    end

    def symbol
        " "
    end
    
end

