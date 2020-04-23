# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        return nil if self.empty?

        return self.max - self.min
    end

    def average
        # can use empty? method
        return nil if self.length == 0

        return self.sum * 1.0 / self.length * 1.0
    end

    def median
       
        return nil if self.length == 0

        len = self.length
        sort_arr = self.sort
        if len.even?
            mid1 = sort_arr[len / 2]
            mid2 = sort_arr[(len / 2) - 1]
            return (mid1 + mid2) * 1.0 / 2
        else
            return sort_arr[len / 2]
        end
    end

    def counts
        hash = Hash.new(0)

        self.each do |ele|
            hash[ele] += 1
        end
        hash
    end

    def my_count(value)
        count = 0

        self.each do |ele|
            count += 1 if ele == value
        end

        count
    end

    def my_index(val)
        
        self.each_with_index do |ele, i|
            if ele == val
                return i
            end
        end

        nil
    end

    def my_uniq
        #can do the hash method where we set hash to true and return hash.keys
        uniques = []
        self.each do |ele|
            if !uniques.include?(ele)
                uniques << ele
            end
        end
        uniques
    end

    def my_transpose
        col = self[0].length
        row = self.length
        new_arr = Array.new(row) {Array.new(col)}

        (0...row).each do |i|
            (0...col).each do |j|
                new_arr[j][i] = self[i][j]
            end
        end
        new_arr
    end
    
end
