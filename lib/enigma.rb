require_relative 'reuseables'
require_relative 'key'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  include Reuseables

  def encrypt(message, key, date)
  end

  def decrypt(ciphertext, key, date)
  end

end
