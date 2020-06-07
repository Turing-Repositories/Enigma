require_relative 'key'
require_relative 'offset'

class Encrypt

  def initialize
    @key = Key.new.generate_key_set_numbers
    @offset = Offset.new.generate_offset_numbers
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
end
