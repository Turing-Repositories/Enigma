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
    key = Key.new

    key.stubs(:rand).returns('43520')

    assert_equal '43520', key.random_key_numbers
  end

  def test_it_can_find_key_set
    key = Key.new('12345')

    expected = {
      :A => '12',
      :B => '23',
      :C => '34',
      :D => '45'
    }

    assert_equal expected, key.generate_key_set_numbers
  end
end
