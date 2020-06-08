require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  include Reuseables
  attr_reader :message

  def initialize(message, key = random_key_numbers, date)
    @message = message
    @key = key
    @date = date
    @offset = offset
  end

  def encrypt(message, key = random_key_numbers, date)
    x = Key.new(key)
    y = Offset.new(date)
    require "pry"; binding.pry
    encrypter = Encrypt.new(message, key, date)

    #encrypter.find_encrpytion_keys(key = @key, offset = @offset)
    #encrypter.encrpytion_keys(numbers = find_encrpytion_keys)
    #encypter.encrypt_message(message, amount_of_shift)
    encrypter.final_encryption
  end

  def decrypt(message, key = offset_numbers, date = todays_date)
    decrypter = Decrypt.new(message, key, date)
    decrypter.final_decryption
  end
end
