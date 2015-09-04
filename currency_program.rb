require './currency'
require './currency_converter'

money1 = Currency.new("10", :USD)
money2 = Currency.new("10 $")
converter = Currency_Converter.new({USD: 1.0, EUR: 0.898, JPY: 119.863})


puts money1.amount
puts money2.amount

#puts money1 + money2
#puts money1 - money2

puts money1 == money2

puts money1 * 4.05

money3 = converter.convert(money1, :EUR)
puts "#{money1.amount} #{money1.c_code} is equal to #{money3.amount} #{money3.c_code}"

puts "Please enter the amount of money you'd like to convert and its symbol ($x or x USD)"
input = gets.chomp
if input.include?(" ")
  amount = input.split(" ")[0]
  c_code = input.split(" ")[1]
  money4 = Currency.new(amount, c_code.to_s)
else
  money4 = Currency.new(input)
end

puts "#{money4.amount} #{money4.c_code}"
