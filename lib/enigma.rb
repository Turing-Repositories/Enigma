require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  include Reuseables
  attr_reader :date
  def initialize
    @date = date
  end

  def encrypt(message, key = random_key_numbers, date = todays_date)
    encrypter = Encrypt.new(message, key, date)
    encrypter.final_encryption
  end

  def decrypt(message, key = offset_numbers, date = todays_date)
    decrypter = Decrypt.new(message, key, date)
    decrypter.final_decryption
  end

end
