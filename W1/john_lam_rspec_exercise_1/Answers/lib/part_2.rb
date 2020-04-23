#part 2 of lib and spec // test driven develop


def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while (i >= 0)
        if vowels.include?(word[i])
            return word[0...i] + word[i + 1..-1]
        end
        i -= 1
    end
    return word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeoiu"
    str.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    p hash
    return hash
end

def caesar_cipher(message, n)
    alpha = ("a".."z").to_a
    new = ""
    #to_a converts range into an array. and ("a".."z") can be seen as a range
    message.each_char do |char|
        if alpha.include?(char)
            old_index = alpha.index(char)
            new_index = old_index + n
            new += alpha[new_index % 26]
        else
            new += char
        end
    end
    new
end
