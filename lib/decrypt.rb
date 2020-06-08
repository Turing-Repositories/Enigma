require_relative 'reuseables'

class Decrypt
  include Reuseables
  attr_reader :message

  def initialize(message, key, date = todays_date)
    @message = message
    @key = key
    @date = date
    @offset = offset
    @decryption_result = ''
  end

  def find_decrpytion_keys(key = @key, offset = @offset)
    key_acc = []
    key.each_value { |v| key_acc << v.to_i}
    offset_acc = []
    offset.each_value { |v| offset_acc << v.to_i }
    keys = key_acc.zip(offset_acc).map { |x, y| (x + y) * -1 }
    keys
  end

  def decrpytion_keys(numbers = find_decrpytion_keys)
    keys = Hash.new
    keys[:A] = numbers[0]
    keys[:B] = numbers[1]
    keys[:C] = numbers[2]
    keys[:D] = numbers[3]
    keys
  end

  def decrypt_message(message, amount_of_shift)
    decrypted_message = ''
    message.each_char.with_index do |char, index|
      if alphabet.include?(char)
      decrypted_message += shift_alphabet_letter(index, amount_of_shift)[alphabet.index(char)]
      else
      decrypted_message += char
      end
    end
    @decryption_result = decrypted_message
  end

  def final_decryption
    { decryption: @decryption_result,
      key: @key,
      date: @date
    }
  end
end
