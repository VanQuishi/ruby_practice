=begin
#Given

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank", "rob", "david"],
            aunts: ["mary", "sally", "susan"]}

f = family.select {|key, value| (key == :sisters) || (key == :brothers)}
puts f.values.flatten
=end

=begin
a = {daughters: ["nin", "no"],
    mom: "thuy",
    dad: "cong"}

b = {mom: "nail technician",
    dad: "nail technician",
    sister: "bankers"}

puts a.merge(b)
puts a
puts b

puts "========"

puts a.merge!(b)
puts a
puts b
=end

=begin
h = {cat: "sung", weight: "3 lbs", height: "40 cm", color: "white and yellow"}

print "keys are: "
puts h.keys

print "values are: "
puts h.values

h.each do |key, value|
    puts "#{key}: #{value}"
end
=end


words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
    'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
    'flow', 'neon']

result = {}

words.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
        result[key].push(word)
    else
        result[key] = [word]
    end
end

result.each_value do |v|
    puts "------"
    p v
end