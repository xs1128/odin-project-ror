# frozen_string_literal: true

tries = 12
secret_code = Array.new(4, -1)

puts 'I am making a code that you\'ll never guess...'

# Create random string of 4
(0..3).each do |i|
  secret_code[i] = rand(1..7)
end

player_guess = Array.new(4, -1)
until tries.zero?
  # guess
  puts 'Make your first guess!' if tries == 12

  guess = gets
  3.downto(0) do |i|
    player_guess[i] = guess[i].to_i
  end

  correct_all = correct_color = 0

  (0...4).each do |i|
    correct_all += 1 if player_guess[i] == secret_code[i]
  end

  player_colors = Hash.new(0)
  secret_colors = Hash.new(0)

  (0...4).each do |i|
    next if player_guess[i] == secret_code[i]

    player_colors[player_guess[i]] += 1
    secret_colors[secret_code[i]] += 1
  end

  player_colors.each do |color, cnt|
    correct_color += [cnt, secret_colors[color]].min
  end

  puts "#{correct_all} correct colors and correct position."
  puts "#{correct_color} correct colors but incorrect position."

  break if correct_all == 4

  tries -= 1
end

puts 'Too bad, you ran out of tries!' if tries.zero?
puts 'Congratz on guessing all!' unless tries.zero?
