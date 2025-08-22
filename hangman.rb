require 'json'

arr = []
guess = tries = target = nil

File.open('words.txt', 'r') do |file|
  arr = file.readlines
end

# choose between 5 to 12 chars
while true
  target = arr.sample
  break if target.length >= 5 && target.length <= 12

  arr.delete(target)
end

# Ask if want to continue if there is something inside the file
if File.exist?('save.json') && !File.zero?('save.json')
  puts 'Do you want to continue from where you left off last time? (Yes / No)'
  res = gets

  if res.include?('Y')
    File.open('save.json', 'r') do |file|
      json_data = file.read
      ruby_obj = JSON.load(json_data)
      guess = ruby_obj['guess']
      tries = ruby_obj['tries']
      target = ruby_obj['target']
    end
  else
    guess = String.new('_' * (target.length - 1))
    tries = 7
  end
else
  guess = String.new('_' * (target.length - 1))
  tries = 7
end

until tries.zero?
  puts 'Do you want to save your current progress? (Yes / No)'
  res = gets
  if res.include?('Y')
    File.open('save.json', 'w') do |file|
      ruby_obj = { guess: guess, tries: tries, target: target }
      json_string = JSON.pretty_generate(ruby_obj)
      file.write(json_string)
    end
  end

  puts "\nPlease begin your guess: (#{tries} tries left)"
  puts "\n #{guess} \n\n"

  inp_char = gets[0]

  puts "\n"

  unless target.include?(inp_char)
    tries -= 1
    next
  end

  (0...target.length).each do |i|
    guess[i] = target[i] if target[i] == inp_char
  end
  break unless guess.include?('_')
end

if guess.include?('_')
  puts "Sorry, you ran out of tries :( and the answer is #{target}"
else
  puts 'Congratz'
end
