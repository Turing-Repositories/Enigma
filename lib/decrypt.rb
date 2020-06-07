require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'

class Decrypt
  attr_reader :message

  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
  end
end
