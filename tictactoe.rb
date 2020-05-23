class GameBoard

    @@board = [1, 2, 3,
                4, 5, 6,
                7, 8, 9]

    def initialize; end

    def display()
        puts " #{@@board[0]} | #{@@board[1]} | #{@@board[2]} "
        puts "-----------"
        puts " #{@@board[3]} | #{@@board[4]} | #{@@board[5]} "
        puts "-----------"
        puts " #{@@board[6]} | #{@@board[7]} | #{@@board[8]} "
    end

    def draw(marker, position)
        if @@board[position].is_a? Integer  #check if the cell has an integer value or not
            @@board[position] = marker
            return true
        else 
            return false
        end
    end

    def check()

        result = false

        WIN_COMBINATIONS.each do |combination|
            a = combination[0]
            b = combination[1]
            c = combination[2]
        
            if @@board[a] == @@board[b] && @@board[b] == @@board[c]
                result = true
                break
            end
        end

        return result

    end

    protected
        WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], 
                            [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

        def emptyBoard()
            @@board = [1, 2, 3,
                        4, 5, 6,
                        7, 8, 9]
        end
end

#========================
class Player < GameBoard

    attr_reader :marker

    def initialize(marker)
        @marker = marker
        emptyBoard()
    end

end

#========================
option = 1

while option == 1 do

    print "1st player's name: "
    name_1 = gets.chomp
    print "Hi #{name_1}! What is your choice of marker?(X or O) "
    marker_1 = gets.chomp.upcase()
    puts "Your marker will be #{marker_1}\n"

    print "2nd player's name: "
    name_2 = gets.chomp

    marker_2 = ''
    if marker_1 == 'X'
        marker_2 = 'O'
    else
        marker_2 = 'X'
    end

    puts "Hi #{name_2}! Your marker will be #{marker_2}"
   
    player_1 = Player.new(marker_1)
    player_2 = Player.new(marker_2)

    player_1.display()
    puts "#{name_1}'s turn:"
    print "Enter the number of the cell you want to mark: "
    pos = gets.chomp.to_i

    player_1.draw(player_1.marker, pos-1)
    player_1.display()
    result = player_1.check()

    puts "#{name_2}'s turn:"
    print "Enter the number of the cell you want to mark: "
    pos = gets.chomp.to_i

    player_2.draw(player_2.marker, pos-1)
    player_2.display()
    result = player_2.check()

    1.upto(7) do |i|
        valid = false
        result = false
        if i.odd? 
            puts "#{name_1}'s turn:"
            print "Enter the number of the cell you want to mark: "
            pos = gets.chomp.to_i
            
            valid = player_1.draw(player_1.marker, pos-1)

            while valid == false do
                puts "Invalid move. Please choose a cell with no token."
                print "Enter the number of the cell you want to mark: "
                pos = gets.chomp.to_i

                valid = player_1.draw(player_1.marker, pos-1)
            end

            player_1.display()
            result = player_1.check()

            if result == true
                puts "The winner is #{name_1}!!!"
                print "Do you want to start a new game? (1 - Yes, 0 - No): "
                option = gets.chomp.to_i
                break
            end

        else
            puts "#{name_2}'s turn:"
            print "Enter the number of the cell you want to mark: "
            pos = gets.chomp.to_i

            valid = player_2.draw(player_2.marker, pos-1)

            while valid == false do
                puts "Invalid move. Please choose a cell with no token."
                print "Enter the number of the cell you want to mark: "
                pos = gets.chomp.to_i

                valid = player_2.draw(player_2.marker, pos-1)
            end

            player_2.display()
            result = player_2.check()

            if result == true
                puts "The winner is #{name_2}!!!"
                print "Do you want to start a new game? (1 - Yes, 0 - No): "
                option = gets.chomp.to_i
                break
            end

        end
    end

    if result == false
        puts "Draw!!!"
        print "Do you want to start a new game? (1 - Yes, 0 - No): "
        option = gets.chomp.to_i
    end

end