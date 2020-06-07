require './test/test_helper.rb'

class DecryptTest < Minitest::Test

  def test_it_exists
    key = Key.new.generate_key_set_numbers
    offset = Offset.new.generate_offset_numbers
    decrypt = Decrypt.new('Hello World!', key, offset)

    assert_instance_of Decrypt, decrypt
  end
end
