require_relative "piece"

class Board
    def initialize
        @rows = Array.new(8) {Array.new(8)}
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
    def set_up
        (0...@rows.length).each do |row|
            (0...@rows.length).each do |col|
                pos = row, col
                if row.between?(0,1) || row.between?(6,7)
                    color = :white
                    self[pos] = Piece.new(color, self, pos)
                else
                    self[pos] = nil
                end
            end
        end
    end

end