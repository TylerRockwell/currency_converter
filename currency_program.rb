require './currency'

money1 = Currency.new(10, "USD")
money2 = Currency.new(20, "USD")

puts money1.amount
puts money2.amount

puts money1 + money2
