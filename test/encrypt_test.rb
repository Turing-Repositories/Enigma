require './test/test_helper.rb'

class EncryptTest < Minitest::Test
  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end

  def test_it_can_combine_key_and_offset_into_array
    encrypt = Encrypt.new

    assert_instance_of Array, encrypt.find_encrpytion_keys
  end

  def test_it_can_turn_encryption_keys_into_hash
    encrypt = Encrypt.new

    assert_instance_of Hash, encrypt.encrpytion_keys
  end

  def test_it_can_find_alphabet
    encrypt = Encrypt.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, encrypt.alphabet
    assert_equal 27, encrypt.alphabet.length
  end

end
