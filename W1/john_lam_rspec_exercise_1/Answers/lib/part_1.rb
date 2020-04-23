

def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum.to_f / arr.length
end

def repeat(str, n)
    
    str * n
    #new_str = ""
    #n.times do
    #   new_str += str
    #end
    #new_str

end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    new = []
    words.each_with_index do |words, i|
        if i % 2 == 0
            new << words.upcase
        else
            new << words.downcase
        end
    end
    new.join(" ")
end