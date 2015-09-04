require './currency'
require './currency_converter'

money1 = Currency.new(10, :USD)
money2 = Currency.new("$10")
converter = Currency_Converter.new({USD: 1.0, EUR: 0.74, JPY: 120.0})


puts money1.amount
puts money2.amount

#puts money1 + money2
#puts money1 - money2

puts money1 == money2

puts money1 * 4.05

money3 = converter.convert(money1, :EUR)
puts "#{money1.amount} #{money1.c_code} is equal to #{money3.amount} #{money3.c_code}"
