class Cell
    attr_accessor :x, :y, :dist, :parent_ptr
    def initialize(x,y,dist, parent_obj = nil)
        @x = x
        @y = y
        @dist = dist
        @parent_ptr = parent_obj
    end
end

def isInside(x,y,n)
    if (x >= 0 && x < n && y >= 0 && y < n )
        return true
    end
    return false
end

def possibleMoves(startPos)
    step_arr = [[2,-1], [2,1], [-2,-1], [-2,1], [-1,-2], [1,-2], [-1,2], [1,2]]

    (0..7).map do |i|   #loop through all possible combinations
        (0..1).map do |k|    #add startPos array to each combination (which is an array)
            step_arr[i][k] + startPos[k]
        end
    end 

end

def knight_moves(startPos, targetPos, n)

    cell_queue = Queue.new

    startPos_obj = Cell.new(startPos[0], startPos[1], 0)

    cell_queue << startPos_obj

    visit = Array.new(n) {Array.new(n)}

    for i in 0..n-1
        for j in 0..n-1
            visit [i][j] = false
        end
    end

    visit[startPos[0]][startPos[1]] = true

    while (!cell_queue.empty?)
        
        curr_cell = cell_queue.pop

        if (curr_cell.x == targetPos[0] && curr_cell.y == targetPos[1])
            parent_stack = []

            temp_cell = curr_cell
            while temp_cell.parent_ptr != nil
                parent_stack.push(temp_cell.parent_ptr)
                temp_cell = temp_cell.parent_ptr
            end

            #====Print moves======
            puts "You made it in #{curr_cell.dist} moves!  Here's your path:"
            #puts "[#{startPos[0]}][#{startPos[1]}]"

            while !parent_stack.empty?
                parent_cell = parent_stack.pop
                puts "[#{parent_cell.x}][#{parent_cell.y}]"
            end

            puts "[#{targetPos[0]}][#{targetPos[1]}]"
            return
        end

        #loop through possible moves
        #if in the board and not visited:
            #set visit to true
            #add to cell_queue
        moves_arr = possibleMoves([curr_cell.x, curr_cell.y])
        
        for i in 0..7
            x = moves_arr[i][0]
            y = moves_arr[i][1]
            if isInside(x, y, n) && visit[x][y] == false
                visit[x][y] = true
                cell_obj = Cell.new(x, y, curr_cell.dist+1, curr_cell)

                cell_queue << cell_obj
            end    
        end    
    end
end

print "What is your board side's length? "
size = gets.chomp.to_i()

print "Insert start position x-coordinate: "
start_x = gets.chomp.to_i()

print "Insert start position y-coordinate: "
start_y = gets.chomp.to_i()

print "Insert target position x-coordinate: "
dest_x = gets.chomp.to_i()

print "Insert target position y-coordinate: "
dest_y = gets.chomp.to_i()

knight_moves([start_x,start_y], [dest_x,dest_y], size)