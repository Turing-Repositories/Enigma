require './test/test_helper.rb'

class EncryptTest < Minitest::Test
  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end

  # def test_it_can_find_key_set_for_encryption
  #   encrypt = Encrypt.new
  #
  #   assert_equal 0, encrypt.key_set_for_encryption
  # end

  def test_it_can_combine_key_and_offset    #expected changes with date?
    encrypt = Encrypt.new
    offset = Offset.new.generate_offset_numbers
    key = Key.new('12345')

    x = key.generate_key_set_numbers

    y = encrypt.find_encrpytion_keys
    require "pry"; binding.pry

    expected = {
      :A => '16',
      :B => '27',
      :C => '34',
      :D => '45'
    }

    assert_equal expected, encrypt.find_encrpytion_keys

  end

end
