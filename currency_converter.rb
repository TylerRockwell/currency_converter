'require Currency'
class Currency_Converter

  def initialize
    @rates = {USD: 1.0, EUR: 0.74}
  end

  def convert(currency, currency_type)
    Currency.new(currency.amount * @rates[currency_type], currency_type)
  end

end
