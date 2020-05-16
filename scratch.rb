arr = ['A', 'B', 'C', 'D']
new_idx = 3

=begin
2.downto(-12) do |i|
    new_idx -= 1
    if new_idx < 0
        new_idx = 3
        next
    end
    p arr[new_idx]
    
end
=end

(3+1).upto(11) do |i|
    new_idx += 1
    if new_idx > 3
        new_idx = 0
        next
    end
    p arr[new_idx]
    
end
