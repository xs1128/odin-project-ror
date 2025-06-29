def ceaser_cipher(target, shifts = 1)
  arr = target.chars.map { |c| c.ord }
  arr.each do |c|
    if c >= 'A'.ord && c <= 'Z'.ord
      print(((c.ord + shifts - 'A'.ord) % 26 + 'A'.ord).chr)
    elsif c >= 'a'.ord && c <= 'z'.ord
      print(((c.ord + shifts - 'a'.ord) % 26 + 'a'.ord).chr)
    else
      print c.chr
    end
  end
end
