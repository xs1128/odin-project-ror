def substrings(sentence, dict)
  # Cleanup dowcase everything
  words_arr = sentence.downcase.split

  # Create the return hash
  ret = Hash.new(0)

  dict.each do |lookup|
    lookup = lookup.downcase
    # Check frequency of lookup as a substring in each word of the input sentence
    words_arr.each do |w|
      ret[lookup] += 1 if w.include?(lookup)
    end
  end
  ret
end

# Sample testcase
# dictionary = %w[below down go going horn how howdy it i low own part partner sit]
# puts substrings("Howdy partner, sit down! How's it going?", dictionary)
