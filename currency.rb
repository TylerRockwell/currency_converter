require './DifferentCurrencyCodeError'

#Define required methods
def is_a_number(input)
  true if Float(input) rescue false
end

def terminate(message="Terminating...")
  #Outputs a message and exits
  puts `clear`
  puts "#{message}"
  puts
  exit
end

def get_currency_type(symbol)
  #Determines currency type based on symbol
  case symbol
  when "$"
    :USD
  when "€"
    :EUR
  when "¥"
    :EUR
  else
    terminate("Symbol not recognized. Terminating...")
  end
end

class Currency
  #Add read access to instance variables
  attr_reader :amount, :c_code

  def initialize (amount, c_code="")
    #Checks format of input
    if c_code == ""
      #Removes currency symbol and determines currency code
      symbol = amount[0]
      amount[0] = ''
      #Validates that amount is a number
      @amount = amount.to_f if is_a_number(amount)
      @c_code = get_currency_type(symbol)
    else
      #Checks that amount is a number and assigns initial instance variables
      is_a_number(amount) ? @amount = amount : terminate("Amount is not a number. Terminating...")
      @c_code = c_code
    end
  end

  def +(money)
    #Overrides normal addition to add object amounts
    @c_code == money.c_code ? @amount + money.amount :  (raise DifferentCurrencyCodeError)
  end

  def ==(money)
    #Overrides normal comparison to compare object amounts and currency codes
    @amount == money.amount && @c_code == money.c_code
  end

  def -(money)
    #Overrides normal subtraction to subtract object amounts
    @c_code == money.c_code ? @amount - money.amount :  (raise DifferentCurrencyCodeError)
  end

  def *(number)
    #Adds ability to multiply amounts by numbers
    @amount * number
  end
end
