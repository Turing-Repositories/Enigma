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

  def alphabet
    ('a'..'z').to_a << ' '
  end

  def shift_alphabet_letter(index, amount_of_shift) #working, but not really sure why?
    return alphabet.rotate(amount_of_shift[:A]) if index % 4 == 0
    return alphabet.rotate(amount_of_shift[:B]) if index % 4 == 1
    return alphabet.rotate(amount_of_shift[:C]) if index % 4 == 2
    return alphabet.rotate(amount_of_shift[:D]) if index % 4 == 3
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
    decrypted_message
  end
end
