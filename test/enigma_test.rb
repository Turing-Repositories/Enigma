require './test/test_helper.rb'

class EnigmaTest < Minitest::Test
  include Reuseables

  def test_it_exists
    enigma = Enigma.new('hello world', '02715', '040895')

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_message_with_key_and_date
    enigma = Enigma.new('hello world', '02715', '040895')

    expected = {
     encryption: "keder ohulw",
     key: "02715",
     date: "040895"
    }

    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
  end

  def test_it_can_decrypt_message_with_key_and_date
    enigma = Enigma.new("keder ohulw", '02715', '040895')

    expected = {
     decryption: "hello world",
     key: "02715",
     date: "040895"
    }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_message_with_key_and_todays_date
    enigma = Enigma.new("hello world", '02715', date_squared)

    expected = {
      :encryption=>"jeb q mctlu",
      :key=>"02715",
      :date=>"4400"
    }

    assert_equal expected, enigma.encrypt("hello world", "02715", date_squared)
  end

end
