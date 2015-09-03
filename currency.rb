require './DifferentCurrencyCodeError'

def is_a_number(input)
  true if Float(input) rescue false
end

def terminate(message="Terminating...")
  puts `clear`
  puts "#{message}"
  puts
  exit
end

def get_currency_type(symbol)
  case symbol
  when "$"
    "USD"
  when "€"
    "EUR"
  when "¥"
    "JPY"
  else
    terminate("Symbol not recognized. Terminating...")
  end
end

class Currency
  attr_reader :amount, :c_code
  def initialize (amount, c_code="")
    if c_code == ""
      symbol = amount[0]
      amount[0] = ''
      @amount = amount.to_f if is_a_number(amount)
      @c_code = get_currency_type(symbol)
    else
      @amount = amount
      @c_code = c_code
    end
  end

  def +(money)
    @c_code == money.c_code ? @amount + money.amount :  (raise DifferentCurrencyCodeError)
  end

  def ==(money)
    @amount == money.amount && @c_code == money.c_code
  end

  def -(money)
    @c_code == money.c_code ? @amount - money.amount :  (raise DifferentCurrencyCodeError)

  end

  def *(number)
    @amount * number
  end
end
