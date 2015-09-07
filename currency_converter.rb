class CurrencyConverter
  attr_reader :rates
  def initialize (rates)
    @rates = rates
  end

  def convert(currency, currency_type)
    @rates[currency_type] && @rates[currency.c_code] ? (multiplier = @rates[currency_type]/@rates[currency.c_code]) : (raise CustomError::UnknownCurrencyCodeError)
    Currency.new(currency.amount * multiplier, currency_type)
  end

end
