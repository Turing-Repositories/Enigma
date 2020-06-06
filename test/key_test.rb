require './test/test_helper.rb'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new('12345')

    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new('12345')

    assert_equal '12345', key.key_set_numbers
  end

  def test_it_can_generate_random_key_numbers
     #look up mocks and stubs
    key = Key.new()

    puts key.key_set_numbers
  end
end
