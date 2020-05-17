require 'pry'

=begin
    user will input a string then thre program checks
    how many times each word in that string appears in pre-defined
    array. This will return a hash

    1, initialize an array with distinct random words (put this in substring function)

    2, write a function called substrings(string, arr)

    ---->this function has 1 parameter. One is a string from the
    user.

    ---->initialize an empty hash
    ---->split the input string into an array of words
    ---->loop through each word, if it's not in the hash yet,
    add it to the hash with value of 1. If it's already in the hash,
    increment tts value by 1
=end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(string, dictionary)
    
    result = {}

    string_arr = string.split()

    string_arr.each do |word|
        dictionary.each do |key|
            if word.downcase().include?(key)
                if result.has_key?(key)
                    result[key] += 1
                else
                    result[key] = 1
                end
            end
        end
    end

    p result
end

substring("Howdy partner, sit down! How's it going?", dictionary)