# frozen_string_literal: true

tries = 12
puts 'Do you want to create the secret code or guess mine? (Create: 0, Guess: 1)'
response = gets.to_i

secret_code = Array.new(4, -1)

if response.zero?

else
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

    # loop through the correc placement
    matched_secret = Array.new(4, false)
    matched_guess = Array.new(4, false)

    correct_place = correct_color = 0

    (0..3).each do |i|
      next unless player_guess[i] == secret_code[i]

      correct_place += 1
      matched_guess[i] = true
      matched_secret[i] = true
    end

    (0..3).each do |i|
      next if matched_guess[i]

      (0..3).each do |j|
        next if matched_secret[j]

        next unless player_guess[i] == matched_secret[j]

        correct_color += 1
        matched_secret[j] = true
        break
      end
    end

    # check how color correct
    puts "#{correct_color} correct colors and #{correct_place} correct placements!"
    tries -= 1
  end
end

puts 'Too bad, you ran out of tries!' if tries.zero?
