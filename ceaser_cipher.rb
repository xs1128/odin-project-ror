def ceaser_cipher(target, shifts = 1)
  arr = target.chars.map do |c|
    if c >= 'A' && c <= 'Z'
      print(((c.ord + shifts - 'A'.ord) % 26 + 'A'.ord).chr)
    elsif c >= 'a' && c <= 'z'
      print(((c.ord + shifts - 'a'.ord) % 26 + 'a'.ord).chr)
    else
      print c.chr
    end
  end
end
