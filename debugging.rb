require 'pry'

=begin
def double_words_in_phrase(string)
  string_array = string.split(' ')

  binding.pry

  string_array.map { |word| word * 2}
  string_array.join(' ')
end

double_words_in_phrase("This is a test")
=end

def yell_greeting(string)
    name = string
  
    
  
    name = name.upcase
    greeting = "WASSAP, #{name}!"
    puts greeting

    binding.pry
end

yell_greeting("bob")