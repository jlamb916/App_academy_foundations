#prc is convention
def reverser(str, &prc)
    rev_str = str.reverse
    #prc.call(str.reverse)
    prc.call(rev_str)

end

def word_changer(str, &prc)
    split_str = str.split(" ")
    new_str = []

    split_str.each do |word|
        new_str << prc.call(word)
    end
    new_str.join(" ")
end

def greater_proc_value(n, prc_1, prc_2)
    v1 = prc_1.call(n)
    v2 = prc_2.call(n)
    if v1 > v2
        v1
    else
        v2
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []

    arr.each_with_index do |ele, i|
        if i.even?
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end