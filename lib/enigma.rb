require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encryption'
require_relative 'decryption'

class Enigma
  include Reuseables
  attr_reader :message

  def initialize(message, key = random_key_numbers, date = todays_date)
    @message = message
    @key = key
    @date = date
    @offset = offset
  end

  def encrypt(message, key, date = todays_date)
    new_key = Key.new(key)
    new_key_set = new_key.generate_key_set_numbers
    new_offset = Offset.new(date)
    new_offset_number_set = new_offset.generate_offset_numbers
    encrypter = Encryption.new(message, key, date)
    new_encryption_keys_array = encrypter.find_encrpytion_keys(new_key_set, new_offset_number_set)
    new_encryption_keys_hash = encrypter.encrpytion_keys(new_encryption_keys_array)
    encrypter.encrypt_message(message, new_encryption_keys_hash)
    encrypter.final_encryption
  end

  def decrypt(message, key, date = todays_date) 
    new_key = Key.new(key)
    new_key_set = new_key.generate_key_set_numbers

    new_offset = Offset.new(date)
    new_offset_number_set = new_offset.generate_offset_numbers
    Encryption.new(message, key, date)

    decrypter = Decryption.new(message, key, date)
    new_decryption_keys_array = decrypter.find_decrpytion_keys(new_key_set, new_offset_number_set)
    new_decryption_keys_hash = decrypter.decrpytion_keys(new_decryption_keys_array)
    decrypter.decrypt_message(message, new_decryption_keys_hash)
    decrypter.final_decryption
  end
end
