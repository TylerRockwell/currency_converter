require './custom_errors'

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
    :JPY
  else
    terminate("Symbol not recognized. Terminating...")
  end
end

class Currency
  #Add read access to instance variables
  attr_reader :amount, :c_code

  def initialize (amount, c_code="")
    if !is_a_number(amount)
      #Remove extra spaces or commas
      amount = amount.delete(" ")
      amount = amount.delete(",")
      if c_code == ""
        #Determines symbol type and extracts number
        symbol = amount[0]
        amount[0] = ''
        c_code = get_currency_type(symbol)
      end
    end
    #Set instance variables
    @amount = amount.to_f.round(2)
    @c_code = c_code
  end

  def +(money)
    #Overrides normal addition to add object amounts
    @c_code == money.c_code ? @amount + money.amount :  (raise CustomError::DifferentCurrencyCodeError)
  end

  def ==(money)
    #Overrides normal comparison to compare object amounts and currency codes
    @amount == money.amount && @c_code == money.c_code
  end

  def -(money)
    #Overrides normal subtraction to subtract object amounts
    @c_code == money.c_code ? @amount - money.amount :  (raise CustomError::DifferentCurrencyCodeError)
  end

  def *(number)
    #Adds ability to multiply amounts by numbers
    @amount * number
  end
end
