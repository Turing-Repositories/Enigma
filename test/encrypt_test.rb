require './test/test_helper.rb'

class EncryptTest < Minitest::Test

  def test_it_exists
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)

    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)

    assert_instance_of Hash, encrypt.key
    assert_instance_of Hash, encrypt.offset
  end

  def test_it_can_total_key_and_offset_into_array
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)

    assert_instance_of Array, encrypt.find_encrpytion_keys
  end

  def test_it_can_turn_encryption_keys_into_hash
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)

    assert_instance_of Hash, encrypt.encrpytion_keys
  end

  def test_it_can_find_alphabet
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers

    encrypt = Encrypt.new('Hello World!', key, offset)

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']

    assert_equal expected, encrypt.alphabet
    assert_equal 27, encrypt.alphabet.length
  end

  def test_it_can_shift_alphabet_letter

    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)
    shift = {:A=>2, :B=>2, :C=>2, :D=>2}
    shift2 = {:A=>1, :B=>1, :C=>1, :D=>1}
    shift3 = {:A=>0, :B=>1, :C=>1, :D=>1}

    expected1 = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
    "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

    expected2 = ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a"]

    expected3 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected1, encrypt.shift_alphabet_letter(1, shift)
    assert_equal expected2, encrypt.shift_alphabet_letter(12, shift2)
    assert_equal expected3, encrypt.shift_alphabet_letter(0, shift3)
  end

  def test_it_can_encrypt_message
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)
    dummy_encryption_keys = {:A=>1, :B=>2, :C=>2, :D=>1}

    assert_equal "ignmpbypsnf!", encrypt.encrypt_message("Hello World!", dummy_encryption_keys)
  end

  def test_it_can_find_encryption_result
    date = Date.today.strftime('%d%m%y')
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    encrypt = Encrypt.new('Hello World!', key, offset)
    dummy_encryption_keys = {:A=>1, :B=>2, :C=>2, :D=>1}
    final_encryption = encrypt.encrypt_message('Hello World!', dummy_encryption_keys)

    expected = { encryption: final_encryption,
                 key: key,
                 date: date
                }

    assert_equal expected, encrypt.final_encryption
  end

end
