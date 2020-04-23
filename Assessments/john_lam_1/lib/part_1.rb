
def is_prime?(n)
    return false if n < 2
    (2...n).each do |i|
        return false if n % i == 0
    end
    true    
end

def nth_prime(n)
    #count var to count the number of prime numbers we have seen
    #calculate if a number if prime
    count = n
    return 2 if n == 1
    i = 0
    infinite = Float::INFINITY
    (2..infinite).each do |j|
        if is_prime?(j)
            prime = j
            count -= 1
        end
        return j if count == 0
    end
end

def prime_range(min, max)
    arr = []
    (min..max).each do |i|
        if is_prime?(i)
            arr << i
        end
    end
    arr
end