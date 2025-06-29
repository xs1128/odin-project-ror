def stock_picker(price_arr)
  # Set days to zero
  # Min day to record the minimum price day
  buy_day = sell_day = min_day = 0
  min_price = price_arr.first
  max_prof = 0

  # Loop through and keep track of min price and max profit
  price_arr.each_with_index do |price, day|
    if price < min_price
      min_price = price
      min_day = day
    elsif price - min_price > max_prof
      sell_day = day
      buy_day = min_day
      max_prof = price - min_price
    end
  end

  # Return the buy and sell day
  [buy_day, sell_day]
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
