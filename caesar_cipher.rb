require 'pry'

$upper_arr = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
            'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

$lower_arr = $upper_arr.join(' ').downcase().split(' ')

def lower_code(char, n)

    result_idx = -1

    $lower_arr.each_with_index do |letter, old_idx| 
        if letter == char
    
            counter = old_idx + n
            new_idx = old_idx

            if n >= 0 
                (old_idx+1).upto(counter) do |i|
                    new_idx += 1
                    if new_idx > 25
                        new_idx = 0
                    end
                    
                end

            
            elsif n < 0
                (old_idx-1).downto(counter) do |i|
                    new_idx -= 1
                    if new_idx < 0
                        new_idx = 25
                    end
                    
                end
            end
            

            result_idx = new_idx
        end  
    end

    return $lower_arr[result_idx]
end

def upper_code(char, n)

    result_idx = -1

    $upper_arr.each_with_index do |letter, old_idx| 
        if letter == char
    
            counter = old_idx + n
            new_idx = old_idx

            if n >= 0 
                (old_idx+1).upto(counter) do |i|
                    new_idx += 1
                    if new_idx > 25
                        new_idx = 0
                    end
                    
                end

            
            elsif n < 0
                (old_idx-1).downto(counter) do |i|
                    new_idx -= 1
                    if new_idx < 0
                        new_idx = 25
                    end
                    
                end
            end
            
            result_idx = new_idx
        end  
    end

    return $upper_arr[result_idx]
end

def caesar_cipher(message, n)
    new_string = ""
    message.length.times do |i|

        if message[i].upcase() == message[i].downcase()
            new_string += message[i]
        
        else
            if message[i] == message[i].upcase()
                new_letter = upper_code(message[i], n)
            else
                new_letter = lower_code(message[i], n)
            end

            new_string += new_letter
        end
    end

    p new_string
end

#==============================
option = 1

while option == 1 do
    print "What is the message? "
    message = gets.chomp


    print "Enter an integer: "
    num = gets.chomp.to_i

    print "Coded message: "
    caesar_cipher(message, num)

    print "Encode another message? (Yes - enter 1, No - enter 0): "
    option = gets.chomp.to_i
end