require_relative "piece"
require_relative "bishop"
require_relative "rook"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"
require_relative "null_piece"

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
        self.set_up
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at position" if self[start_pos] == nil
        piece = self[start_pos]
        raise "Not valid position to move to" if !valid_pos?(end_pos)
        raise "Invalid move for piece" if !piece.valid_moves.include?(end_pos)
        piece.pos = end_pos
        self[start_pos] = nil
    end

    private
    attr_reader :null_piece
    def set_up
        pieces_class = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        (0...@rows.length).each do |row|
            (0...@rows.length).each do |col|
                pos = row, col
                color = :white if row.between?(0, 1)
                color = :black if row.between?(6, 7)
                case row
                    when 0, 7
                        self[pos] = pieces_class[col].new(color, self, pos)
                    when 1, 6
                        self[pos] = Pawn.new(color, self, pos)
                    else
                        self[pos] = @null_piece
                end
            end
        end
    end
end
b = Board.new