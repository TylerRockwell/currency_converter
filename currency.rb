class Currency
  attr_accessor :amount
  attr_accessor :c_code

  def initialize (amount, c_code)
    @amount = amount
    @c_code = c_code
  end

  def +(money)
    @c_code == money.c_code ? @amount += money.amount : false


  end

  def -(money)

  end
end
