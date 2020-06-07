require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'

class Decrypt
  include Reuseables
  attr_reader :message

  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
    @decryption_result = ""
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
    @decryption_result += decrypted_message
  end

  def final_decryption
    { decryption: @decryption_result,
      key: @key,
      date: todays_date
    }
  end
end
