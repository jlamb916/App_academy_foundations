require "byebug"

def select_even_nums(arr)
    #arr.select(&:even?)
    arr.select {|num| num.even?}
end

def reject_puppies(arr)
    #each block acts on dog = [{"name"=>fido, "age"=>3}]
    arr.reject {|ele| ele["age"] <= 2}
end

#count method counts the number of expressions that evalue to true
def count_positive_subarrays(arr)
    arr.count { |sub_arr| sub_arr.sum > 0}
end

def aba_translate(str)
    vowels = "aeoiu"
    new_word = []
    str.each_char do |char|
        if vowels.include?(char)
            new_word << char + "b" + char
        else
            new_word << char
        end
    end
    new_word.join("")
    #if vowel add a b and + vowel
end

def aba_array(arr)

    arr.map { |words| aba_translate(words)}
end

