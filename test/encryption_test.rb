require './test/test_helper.rb'

class EncryptionTest < Minitest::Test
  def test_it_exists
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)

    assert_instance_of Encryption, encryption
  end

  def test_it_has_attributes
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)

    assert_instance_of Hash, encryption.key
    assert_instance_of Hash, encryption.offset
  end

  def test_it_can_total_key_and_offset_into_array
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)

    assert_instance_of Array, encryption.find_encrpytion_keys
  end

  def test_it_can_turn_encryptionion_keys_into_hash
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)

    assert_instance_of Hash, encryption.encrpytion_keys
  end

  def test_it_can_find_alphabet
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers

    encryption = Encryption.new('Hello World!', key, date)

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    assert_equal expected, encryption.alphabet
    assert_equal 27, encryption.alphabet.length
  end

  def test_it_can_shift_alphabet_letter

    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)
    shift = {:A=>2, :B=>2, :C=>2, :D=>2}
    shift2 = {:A=>3, :B=>27, :C=>12, :D=>11}
    shift3 = {:A=>0, :B=>1, :C=>1, :D=>1}

    expected1 = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
    "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

    expected2 = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c"]

    expected3 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected1, encryption.shift_alphabet_letter(1, shift)
    assert_equal expected2, encryption.shift_alphabet_letter(12, shift2)
    assert_equal expected3, encryption.shift_alphabet_letter(0, shift3)
  end

  def test_it_can_encrypt_message
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)
    dummy_encryption_keys = {:A=>1, :B=>2, :C=>2, :D=>1}

    assert_equal "ignmpbypsnf!", encryption.encrypt_message("Hello World!", dummy_encryption_keys)
  end

  def test_it_can_find_encryption_result
    key = Key.new.generate_key_set_numbers
    date = Offset.new.generate_offset_numbers
    encryption = Encryption.new('Hello World!', key, date)
    dummy_encryption_keys = {:A=>1, :B=>2, :C=>2, :D=>1}

    encryption.encrypt_message("Hello World!", dummy_encryption_keys)

    assert_instance_of Hash, encryption.final_encryption
  end
end
