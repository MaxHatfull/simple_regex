class Dot < Token
  def is_match?(test)
    return true if next_token.nil?

    next_token.is_match?(test[1..-1])
  end
end
