class Currency_Trader

  def initialize(rate_collection, start_currency)
    @rate_collection = rate_collection
    @start_currency = start_currency
  end

  def find_best_investment
    max_value = 0
    type = "0"
  #  key_arr = @rate_collection.rates.keys
    (0..@rate_collection.length-2).each do |i|
      past_hash = @rate_collection[i].rates
      present_hash = @rate_collection[i+1].rates
      key_arr = past_hash.keys
      key_arr.each_index do |x|
        gain = past_hash[key_arr[x]] / present_hash[key_arr[x]]
        if gain > max_value
          max_value = gain
          type = key_arr[x]
        end
      end
      #  puts "#{past_hash[x]} ==>> #{i.rates[cur]}" #if @rates_collection[i+1].rates[cur] != nil
      end
    puts "The best investment is #{type.to_s} with a return of #{(max_value * 100).round(2)}%"
  end

  def output
    puts @rate_collection[0].rates[:USD]
  end
end
