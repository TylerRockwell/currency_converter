class Currency
  attr_reader :amount, :c_code

  def initialize (amount, c_code)
    @amount = amount
    @c_code = c_code
  end

  def +(money)
    @c_code == money.c_code ? @amount + money.amount : false
  end

  def ==(money)
    @amount == money.amount && @c_code == money.c_code
  end

  def -(money)
    @c_code == money.c_code ? @amount - money.amount :  false
  end

  def *(number)
    @amount * number
  end
end
