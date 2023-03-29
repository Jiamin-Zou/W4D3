require_relative "piece.rb"

class Pawn < Piece
    def symbol
        "♟".colorize(color)
    end
    def moves
        pos = self.pos
        move = []
        forward_steps.each do |d|
            dx, dy = d
            row = dx + pos[0]
            col = dy + pos[1]
            new_pos = row, col
            if @board[new_pos].is_a?(NullPiece) && @board.valid_pos?(new_pos)
                move << new_pos
            end
        end
        move + side_attacks 
    end

    private
    def at_start_row?
        return pos[0] == 1 if self.color == :white
        return pos[0] == 6 if self.color == :black
    end

    def forward_dir
        return 1 if self.color == :white
        return -1 if self.color == :black
    end

    def forward_steps
        steps = []
        if self.color == :white
            steps << [1, 0]
            steps << [2, 0] if self.at_start_row?
        else
            steps << [-1, 0]
            steps << [-2, 0] if self.at_start_row?
        end
        return steps
    end

    def side_attacks
        dx = forward_dir
        attack = [dx, -1], [dx, 1]
        attack.select do |pos|
            pos.valid_pos?(pos) && @board[pos].color != self.color && !@board[pos].is_a?(NullPiece)
        end
    end
end