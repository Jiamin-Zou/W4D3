module Slideable

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def vertical_dirs
        VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        self.move_dirs.each do |d|
            dx, dy = d
            moves += self.grow_unlocked_moves_in_dir(dx, dy)
        end
        
        moves
    end
    
    private
    def move_dirs
        raise NotImplementedError
    end

    def grow_unlocked_moves_in_dir(dx, dy)
        final_pos = []
        pos = self.pos
        while @board.valid_pos?(pos)
            pos[0] += dx 
            pos[1] += dy
            piece = board[pos]
            if piece.is_a?(NullPiece)
                final_pos << pos
            elsif piece.color != self.color
                final_pos << pos
                break
            else
                break
            end
        end
        return final_pos
            
    end

    HORIZONTAL_DIRS = [
        [0, -1],
        [0, 1]
    ].freeze

    VERTICAL_DIRS = [
        [-1, 0],
        [1, 0]
    ].freeze

    DIAGONAL_DIRS = [
        [1, -1],
        [1, 1],
        [-1, 1],
        [-1, -1]
    ].freeze
end
    