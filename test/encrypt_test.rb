require './test/test_helper.rb'

class EncryptTest < Minitest::Test

  def test_it_exists
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new("Hello World!", key, offset)

    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new("Hello World!", key, offset)

    assert_instance_of Hash, encrypt.key
    assert_instance_of Hash, encrypt.offset
  end

  def test_it_can_total_key_and_offset_into_array
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new("Hello World!", key, offset)

    assert_instance_of Array, encrypt.find_encrpytion_keys
  end

  def test_it_can_turn_encryption_keys_into_hash
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new("Hello World!", key, offset)

    assert_instance_of Hash, encrypt.encrpytion_keys
  end

  def test_it_can_find_alphabet
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new("Hello World!", key, offset)

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
      "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, encrypt.alphabet
    assert_equal 27, encrypt.alphabet.length
  end

end
