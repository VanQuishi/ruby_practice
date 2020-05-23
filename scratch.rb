board = ["X", "X", "O", "X", "O", "X", " ", "X", "X"]

def display(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], 
[1,4,7], [2,5,8], [0,4,8], [2,4,6]]

display(board)

WIN_COMBINATIONS.each do |combination|
    a = combination[0]
    b = combination[1]
    c = combination[2]

    if board[a] == board[b] && board[b] == board[c] && board[a] != " " && board[b] != " " && board[c] != " "
        puts "true"
        break
    else
        puts "false"
    end
end

=begin
arr = [[1,2,3], [4,5,6]]
arr.each do |sub_array|
    sub_array.each do |i|
        p i
    end
end 
=end       
