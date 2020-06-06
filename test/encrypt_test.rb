require './test/test_helper.rb'

class EncryptTest < Minitest::Test
  def test_it_exists
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end
end
