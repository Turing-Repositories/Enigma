require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  include Reuseables
  attr_reader :message

  def initialize(message, key, date = todays_date)
    @message = message
    @key = key
    @date = date
    @offset = offset

  end

  def encrypt(message, key, date = todays_date)
    new_key = Key.new(key)
    a = new_key.generate_key_set_numbers
    new_offset = Offset.new(date)
    b = new_offset.generate_offset_numbers
    c = encrypter = Encrypt.new(message, key, date)
    d = encrypter.find_encrpytion_keys(a, b)
    e = encrypter.encrpytion_keys(d)
    f = encrypter.encrypt_message(message, e)
    g = encrypter.final_encryption
  end

  def decrypt(message, key, date = todays_date)
    new_key = Key.new(key)
    a = new_key.generate_key_set_numbers
    new_offset = Offset.new(date)
    b = new_offset.generate_offset_numbers
    c = encrypter = Encrypt.new(message, key, date)
    d = encrypter.find_encrpytion_keys(a, b)
    e = encrypter.encrpytion_keys(d)


    f = decrypter = Decrypt.new(message, key, date)
    g = decrypter.find_decrpytion_keys(a, b)
    h = decrypter.decrpytion_keys(g)
    i = decrypter.decrypt_message(message, h)
    j = decrypter.final_decryption
  end
end
