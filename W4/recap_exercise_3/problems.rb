#repl read - evaluate - print loop

#no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    #can use the select method
    # hash.keys.select {|ele| hash[ele] == 1}
    new = []
    hash.each do |k, v|
        new << k if v == 1
    end
    new
    #another way to do it is sort and if there are adjacent pairs
    #   we know that it is not a unique pair
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end
# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

# char_indices
# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)
    hash = Hash.new([])
    str.each_char.with_index do |char, idx|
        hash[char] += [idx]
    end
    hash
end
# Examples
#p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
#p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4

# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.
def longest_streak(str)
    longest = ""
    max = 0
    (0...str.length).each do |start_idx|
        char = str[start_idx]
        count = 0
        
        (start_idx + 1...str.length).each do |end_idx|
            if char != str[end_idx]
                break
            end
            count += 1
        end
        if count >= max
            max = count
            longest = str[start_idx..start_idx + count]
        end
    end
    longest
    #currently this function is going forward so its More than O(N).
    # instead count backwards, this way we can do it in one loop
    #  longest = ""
    # current = ""
    #(0...str.length).each do |i|
    #   if str[i] == str[i - 1] || i == 0
    #       current += str[i]
    #   else
    #       current = str[i]
    #   end
    #  
    #   if current.length >= longest.length
    #       longest = current
    #   end
    # end
    #   longest
end
# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

#get an array of prime numbers up to the num. go through the array and see if any of the numbers multiply to the num

def is_prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0
    end
    true    
end

def bi_prime?(num)
    prime_arr = []
    (2...num).each do |n|
        prime_arr << n if is_prime?(n)
    end
    (0...prime_arr.length).each do |i|
        (i...prime_arr.length).each do |j|
            return true if prime_arr[i] * prime_arr[j] == num
        end
    end
    false
            
end

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24
# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    count = 0
    message.each_char.with_index do |char, idx|
        pos = alpha.index(char)
        #rather than count we can do key alpha[(pos + key[idx % key.length] )% 26]
        message[idx] = alpha[(pos + keys[count]) % alpha.length]
        count += 1
        count = 0 if count == keys.length
    end
    message
end
# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(str)
    vowel_arr= []
    
    vowels = "aeiou"
    #can use select to select vowels
    # vowel_arr = (0...str.length).select {|i| vowels.include?(str[i])}
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            vowel_arr << char
        end
    end
    #rather than pop and unshift, we can use rotate method
    last = vowel_arr.pop
    vowel_arr.unshift(last)
    count = 0
    #our new_vowel array and our rotated_vowel array will now look like this
    # [1, 3, 7] => [7, 1, 3]
    #what we can do is change the values according to the idx
    # str[old[0]], which is str[1] should now be str[new[0]]
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            str[i] = vowel_arr[count]
            count += 1
        end
    end
    str

end
# Examples

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"