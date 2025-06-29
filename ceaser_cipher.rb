def ceaser_cipher(target='Hello, world!', shifts=1)
  target.chars.map do |c|
    case c
    when 'a'..'z' then ((c.ord + shifts - 'a'.ord) % 26 + 'a'.ord).chr
    when 'A'..'Z' then ((c.ord + shifts - 'A'.ord) % 26 + 'A'.ord).chr
    else c
    end
  end.join
end

# Use case
# put ceaser_cipher('whatever HERE!', 5)
