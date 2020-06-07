require_relative 'key'
require_relative 'offset'

class Encrypt
  attr_reader :message

  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
  end

  def key
    Key.new.generate_key_set_numbers
  end

  def offset
    Offset.new.generate_offset_numbers
  end

  def find_encrpytion_keys(key = @key, offset = @offset)
    key_acc = []
    key.each_value { |v| key_acc << v.to_i }
    offset_acc = []
    offset.each_value { |v| offset_acc << v.to_i }
    keys = key_acc.zip(offset_acc).map { |x, y| x + y }
    keys
  end

  def encrpytion_keys(numbers = find_encrpytion_keys)
    keys = Hash.new
    keys[:A] = numbers[0]
    keys[:B] = numbers[1]
    keys[:C] = numbers[2]
    keys[:D] = numbers[3]
    keys
  end

  def alphabet
    ('a'..'z').to_a << ' '
  end

  def shift_alphabet_letter(index, amount_of_shift) #working, but not really sure why?
    return alphabet.rotate(amount_of_shift[:A]) if index % 4 == 0
    return alphabet.rotate(amount_of_shift[:B]) if index % 4 == 1
    return alphabet.rotate(amount_of_shift[:C]) if index % 4 == 2
    return alphabet.rotate(amount_of_shift[:D]) if index % 4 == 3
  end
end
