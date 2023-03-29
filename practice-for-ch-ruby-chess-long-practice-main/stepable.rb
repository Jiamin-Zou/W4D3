module Stepable
    def moves
        final_pos = []
        pos = self.pos
        self.move_diffs.each do |d|
            dx, dy = d
            row = pos[0] + dx
            col = pos[1] + dy
            new_pos = row, col
            piece = @board[new_pos]
            next if !@board.valid_pos?(new_pos)

            if piece.is_a?(NullPiece) || piece.color != self.color
                final_pos << new_pos
            end
        end

        final_pos
    end

    private

    def move_diffs
        raise NotImplementedError
    end
end