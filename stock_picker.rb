require 'pry'

=begin
    User will input a series of numbers separate by space in between
    
    1, Program split this input into an array of strings(will change to int later)
    
    2, Go from last item in array. Substract it to each of the rest 
    and compare to the max. If greater, store the result in the max var

=end

def stock_picker(price_array)

    max_profit = 0

    last_day = price_array.length-1
    sell_day = -1
    buy_day = -1
    result = []

    (last_day).downto(1) do |i|
        (i-1).downto(0) do |k|

            profit = price_array[i].to_i - price_array[k].to_i
            
            if profit > max_profit
                max_profit = profit
                sell_day = i
                buy_day = k
            end
        end
    end

    result.push(buy_day)
    result.push(sell_day)
    p result
end

option = 1

while option == 1 do
    puts "Insert stock prices separated by a space: "

    user_input = gets.chomp

    input_array = user_input.split(' ')
    stock_picker(input_array)

    print "Continue this session? (Yes - enter 1, No - enter 0): "
    option = gets.chomp.to_i
end