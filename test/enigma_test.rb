require './test/test_helper.rb'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_message_with_key_and_date
    # mock_message = mock('hello world')
    # mock_key = mock('02715')
    # mock_date = mock('040895')
    enigma = Enigma.new

    expected = {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
    }
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
  end

  def test_it_can_decrypt_message_with_key_and_date
    skip
    enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
    }

    assert_equal expected, enigma.decrypt
  end

  def test_it_can_encrpy_message_with_key_and_todays_date
    skip
    encrypted = enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_message_with_key_and_todays_date
    skip
    enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_it_can_encrypt_message_with_random_key_and_todays_date
    skip
    enigma.encrypt("hello world")
  end
end
