'require Currency'
class Currency_Converter

  def initialize
    @rates = {USD: 1.0, EUR: 0.74, JPY: 120.0}
  end

  def convert(currency, currency_type)
    multiplier = @rates[currency_type]/@rates[currency.c_code]
    Currency.new(currency.amount * multiplier, currency_type)
  end

end
