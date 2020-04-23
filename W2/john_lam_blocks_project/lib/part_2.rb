def all_words_capitalized?(arr)
    arr.all? {|word| word == word.capitalize }
end

def no_valid_url?(arr)
    #can use the method .end_with
    #
    url_end= ["com", "net", "io", "org"]
    #arr.none? do |url|
        #url_end.any? { |ending| url.end_with?(ending)}
        #what the above method does is checks to see if any of the end urls match up with the end of the url.
    arr.none? do |url|
        new = url.split(".")
        if url_end.include?(new[1])
            return false
        end
    end
    

end

def any_passing_students?(arr)
    
    arr.any? do |students|
        average = students[:grades].sum / students[:grades].length
        average > 75
    end
end