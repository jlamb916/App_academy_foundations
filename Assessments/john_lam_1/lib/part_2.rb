
def element_count(arr)
    word_table = Hash.new(0)

    arr.each do |word|
        word_table[word] += 1
    end
    word_table
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, idx|
        if hash.has_key?(char)
            str[idx] = hash[char]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|acc, ele| acc * ele }
end