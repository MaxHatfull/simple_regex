require_relative 'token'
require_relative 'dot'
require_relative 'star'
require_relative 'literal_character'

class SimpleRegex
  attr_reader :first_token

  def initialize(regex)
    regex_chars = regex.chars
    regex_chars, @first_token = extract_token(regex_chars)

    current_token = first_token
    while regex_chars.any?
      regex_chars, t = extract_token(regex_chars)
      current_token.next_token = t
      current_token = t
    end
  end

  def match(test)
    first_token.is_match?(test.chars)
  end

  private

  def extract_token(regex)
    if regex.length > 1 && regex[1] == "*"
      return [ regex[2.. -1], Star.new(to_simple_token(regex[0]))]
    end
    [regex[1..-1], to_simple_token(regex[0])]
  end

  def to_simple_token(x)
    case x
    when "."
      Dot.new
    when "*"
      Star.new(previous)
    else
      LiteralCharacter.new(x)
    end
  end
end
