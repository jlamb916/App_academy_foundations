require "byebug"

def my_reject(arr, &prc)
    new_arr = []

    arr.each do |ele|
        if !prc.call(ele)
            new_arr << ele
        end
    end
    new_arr

end

def my_one?(arr, &prc)
    count = 0

    arr.each do |ele|
        if prc.call(ele)
            count += 1
        end
    end
    
    return true if count == 1
    
    false
end

def hash_select(hash, &prc)
    new_hash = {}

    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end
    
    new_hash
end

# xor has to be opposites

def xor_select(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |ele|
        if prc_1.call(ele) && !prc_2.call(ele) || !prc_1.call(ele) && prc_2.call(ele)
            new_arr << ele
        end
    end

    new_arr
end

def proc_count(val, procs)
    count = 0

    procs.each do |block|
        if block.call(val)   
            count += 1
        end
    end
    count 
end