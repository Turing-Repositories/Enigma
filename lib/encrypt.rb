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

end
