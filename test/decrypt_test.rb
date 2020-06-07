require './test/test_helper.rb'

class DecryptTest < Minitest::Test

  def test_it_exists
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decrypt = Decrypt.new('Hello World!', key, offset)

    assert_instance_of Decrypt, decrypt
  end

  def test_it_can_decrypt_message
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decrypt = Decrypt.new('Hello World!', key, offset)

    dummy_decryption_keys = {:A=>-1, :B=>-2, :C=>-2, :D=>-1}
    assert_equal "hello world!", decrypt.decrypt_message('ignmpbypsnf!', dummy_decryption_keys)
  end

  def test_it_can_find_decryption_result
    date = Date.today.strftime('%d%m%y')
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decrypt = Decrypt.new('Hello World!', key, offset)
    dummy_decryption_keys = {:A=>-1, :B=>-2, :C=>-2, :D=>-1}
    final_decryption = decrypt.decrypt_message('ignmpbypsnf!', dummy_decryption_keys)

    expected = { decryption: final_decryption,
                 key: key,
                 date: date
                }

    assert_equal expected, decrypt.final_decryption
  end
end
