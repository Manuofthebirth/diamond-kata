class Diamond
  def build(input)
  	separator = '_' # to be multiplied
    
    letters_array = ('A'..input.upcase).to_a # if input = 'd' then letters_array = [A, B, C, D]
    last_letter_index = letters_array.index(input.upcase) # letter index inside array
    mid_separators_num = (1..100).to_a.select(&:odd?).unshift(0) # array with only odd numbers ; 0 at index 0 for A

    top_to_mid_half = [] 

    letters_array.each_with_index do |letter, index|
      side_separators = separator * (last_letter_index - index) # always the difference between last letter index and current letter index 
      mid_separators = separator * mid_separators_num[index] # always with odd numbers
      repeated_letter = index > 0 ? letter : nil  # exception for A
      top_to_mid_half << ["#{side_separators}#{letter}#{mid_separators}#{repeated_letter}#{side_separators}"] # line composition 
    end

    top_bottom = top_to_mid_half[0..-2].reverse # remove middle letter (last element) then reverse order
	  top_to_mid_half.concat(top_bottom).flatten.flatten.join("\n") << "\n" # top + bottom ; remove duplicated array ; one line for each letter   
  end
end
