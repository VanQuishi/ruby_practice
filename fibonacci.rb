def fibs(num)

    i = 0
    fib_arr = []

    while i < num
        if i < 2
            fib_arr.push(i)
            print "#{i} "
        else
            temp = fib_arr[i-1] + fib_arr[i-2]
            fib_arr.push(temp)
            print "#{temp} "
        end
        i += 1
    end

    puts "\n"
end

num = gets.chomp.to_i()
fibs(num)