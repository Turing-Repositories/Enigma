require './test/test_helper.rb'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new('12345')

    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new('12345')

    assert_equal '12345', key.key_numbers
  end
end
