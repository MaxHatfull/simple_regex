class Token
  attr_reader :next_token

  def next_token=(token)
    @next_token = token
  end
end