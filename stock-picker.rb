def stock_picker(stock_array)

  #sample run with [17,3,6,9,15,8,6,1,10]

  min_price = stock_array[0] #Initialize minimum price with the first day's price -> 17
  min_index = 0              #Initialize the index for the minimum price
  max_profit = 0             #Initialize max profit to zero
  best_days = [0,0]          #To store the best days to buy and sell

  stock_array.each_with_index do |price, i|
    next if i==0             #Skip the first day since it has no prior day to compare -> price = 17 is skipped
  
    potential_profit = price - min_price #Calculates potential profit -> 3 - 17 = -14

    if potential_profit > max_profit #Updates max_profit and best_days if needed -> no update since -14 is less than 0
      max_profit = potential_profit
      best_days = [min_index, i]
    end

    if price < min_price #updates min_price and min_index if a new lower price is found -> update min_price = 3 and min_index = 1
      min_price = price
      min_index = i
    end
  end
  best_days
end

if __FILE__ == $0

  array = ARGV[0].split(",").map(&:to_i)
  puts stock_picker(array).inspect
end
