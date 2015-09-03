module CustomError

  class DifferentCurrencyCodeError < StandardError
    def message
      "Currency types do not match."
    end
  end

  class UnknownCurrencyCodeError < StandardError
    def message
      "Sorry, I do not know that currency."
    end
  end
end
