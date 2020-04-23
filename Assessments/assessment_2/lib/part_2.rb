require "byebug"
def proper_factors(num)
    new_arr = []

    (1...num).each do |i|
        if num % i == 0
            new_arr << i
        end
    end
    new_arr
end

def aliquot_sum(num)
    
    proper_factors(num).sum
end

def perfect_number?(num)
    
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    new_arr = []
    j = n
    (1..10000).each do |i|
        break if j == 0
        if perfect_number?(i)
           new_arr << i
            j -= 1                
        end
    end
    return new_arr
end