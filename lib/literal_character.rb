class LiteralCharacter < Token
  attr_reader :character
  def initialize(c)
    @character = c
  end

  def is_match?(test)
    return false if test.nil?
    return false if test.first != character
    return true if next_token.nil?

    next_token.is_match?(test[1..-1])
  end

  def direct_match?(x)
    x == character
  end
end
