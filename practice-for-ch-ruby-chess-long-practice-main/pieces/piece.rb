class Piece
    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def valid_moves
        moves.reject{|move| move_into_check(move)}
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        raise NotImplementedError
    end

    private
    def move_into_check?(end_pos)
        king = @board.find_king(self.color)
        opp_pieces = self.find_opp_pieces

        opp_pieces.each do |piece|
            return true if piece.moves.include?(king.pos)
        end
        false
        
    end

    def find_opp_pieces
        opp_pieces = []
        @board.rows.each do |row|
            row.each do |piece|
                if piece.color != self.color && !piece.is_a?(NullPiece)
                    opp_pieces << piece
                end
            end
        end
        opp_pieces
    end


end