def merge_sort(unsorted_arr)
    if unsorted_arr.length <= 1
        return unsorted_arr
    else
        middle = unsorted_arr.length/2

        left_arr = merge_sort(unsorted_arr.slice(0...middle)) #this slice() return an array from first element up to index mid-1
        right_arr = merge_sort(unsorted_arr.slice(middle...(unsorted_arr.length)))

        merge(left_arr, right_arr)
    end
end

def merge(left_arr, right_arr)
    sorted_arr = []

    while !left_arr.empty? && !right_arr.empty? do
        # we are shifting out the compared/used values so we don't repeat
        if left_arr[0] < right_arr[0]
            sorted_arr.push(left_arr.shift)  #shift will remove that element out of the og array and return it
        else   
            sorted_arr.push(right_arr.shift)
        end
    end 
    #concat appends elements of another array to an array
    return sorted_arr.concat(left_arr).concat(right_arr)
end

arr = [1,2,3,8,7,6]
p merge_sort(arr)