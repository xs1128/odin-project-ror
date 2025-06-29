# Nothing much to say, standard bubble sort and early exit

def bubble_sort(arr)
  len = arr.length

  (len - 1).times do |i|
    swaps = 0
    (0...len - i - 1).each do |j|
      next unless arr[j] > arr[j + 1]

      temp = arr[j]
      arr[j] = arr[j + 1]
      arr[j + 1] = temp
      swaps += 1
    end
    break if swaps == 0
  end
  arr
end

p bubble_sort([4, 3, 78, 2, 0, 2])
