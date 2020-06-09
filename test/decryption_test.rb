require './test/test_helper.rb'
class DecryptionionTest < Minitest::Test
  def test_it_exists
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decryption = Decryption.new('Hello World!', key, offset)

    assert_instance_of Decryption, decryption
  end

  def test_it_can_find_decryptionion_keys
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decryption = Decryption.new('Hello World!', key, offset)

    assert_instance_of Array, decryption.find_decrpytion_keys
  end

  def test_it_can_turn_decryptionion_keys_into_hash
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decryption = Decryption.new('Hello World!', key, offset)

    assert_instance_of Hash, decryption.decrpytion_keys
  end

  def test_it_can_decryption_message
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decryption = Decryption.new('Hello World!', key, offset)

    dummy_decryptionion_keys = {:A=>-1, :B=>-2, :C=>-2, :D=>-1}

    assert_equal "hello world!", decryption.decrypt_message('ignmpbypsnf!', dummy_decryptionion_keys)
  end

  def test_it_can_find_decryptionion_result
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decryption = Decryption.new('Hello World!', key, offset)

    assert_instance_of Hash, decryption.final_decryption
  end
end
