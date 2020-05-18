def bubble_sort(arr)
    
    (1).upto(arr.length-1) do |k|
        swapped = false
        (0).upto(arr.length-1-k) do |i|
            if arr[i].to_i > arr[i+1].to_i
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp
                swapped = true
            end   
        end   
        break if swapped == false
    end

    p arr
    
end

option = 1

while option == 1 do
    puts "Insert numbers separated by a space: "

    user_input = gets.chomp

    input_array = user_input.split(' ')
    bubble_sort(input_array)

    print "Continue this session? (Yes - enter 1, No - enter 0): "
    option = gets.chomp.to_i
end