class Star < Token
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def is_match?(test)
    return true if next_token && next_token.is_match?(test)
    return true if test.nil?
    return true if self.is_match?(test[1..-1])
    return false unless token.direct_match?(test.first)
    return true if next_token.nil?

    next_token.is_match?(test[1..-1])
  end
end
