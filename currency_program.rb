require './currency'

money1 = Currency.new(10, "USD")
money2 = Currency.new("$10")



puts money1.amount
puts money2.amount

puts money1 + money2
puts money1 - money2

puts money1 == money2

puts money1 * 4.05
