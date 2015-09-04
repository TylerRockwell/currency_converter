require './currency'
require './currency_converter'
require './currency_trader'


def format_output(output, c_code)
  "#{format('%.02f', output)} #{c_code}"
end

#### TEST CODE #####
money1 = Currency.new("10", :USD)
money2 = Currency.new("$10")
converter = Currency_Converter.new({USD: 1.0, EUR: 0.898, JPY: 119.863})

puts format_output(money1.amount, money1.c_code)
puts format_output(money2.amount, money1.c_code)

puts format_output(money1 + money2, money1.c_code)
puts format_output(money1 - money2, money1.c_code)

puts money1 == money2

puts format_output(money1 * 4.05, money1.c_code)

money3 = converter.convert(money1, :EUR)
puts "#{format_output(money1.amount, money1.c_code)} is equal to #{format_output(money3.amount, money3.c_code)}"
=begin
puts "Please enter the amount of money you'd like to convert and its symbol ($x or x USD)"
input = gets.chomp
if input.include?(" ")
  amount = input.split(" ")[0]
  c_code = input.split(" ")[1]
  money4 = Currency.new(amount, c_code.to_s)
else
  money4 = Currency.new(input)
end

puts "#{format_output(money4.amount, money4.c_code)}"
=end
old_value = Currency_Converter.new({USD: 1, EUR: 0.767, GBP: 0.642, AUD: 1.353, CAD: 1.355, JPY: 102.162})
present_value = Currency_Converter.new({USD: 1, EUR: 0.898, GBP: 0.656, AUD: 1.433, CAD: 1.322, JPY:119.863})

hash_array = [old_value, present_value]
#trader = Currency_Trader.new(old_value, present_value, :USD)
#trader.find_best_investment

trader = Currency_Trader.new(hash_array, :USD)
#trader.output
trader.find_best_investment
