require './test/test_helper.rb'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_has_attributes
    offset = Offset.new('040895')

    assert_equal '040895', offset.offset_numbers
  end

  def test_it_can_find_todays_date
    date = Date.today.strftime("%d%m%y")
    offset = Offset.new

    assert_equal date, offset.todays_date
  end

  def test_it_can_find_last_four_digits_of_squared_date
    date = Date.today.strftime("%d%m%y")
    offset = Offset.new
    last_4_digits_of_squared_date = (date.to_i ** 2).to_s.slice(-4..-1)

    offset2 = Offset.new('040895')

    assert_equal last_4_digits_of_squared_date, offset.date_squared
    assert_equal "1025", offset2.square_offset_numbers
  end

  def test_it_can_generate_offset_numbers
    offset = Offset.new('040895')
    offset.square_offset_numbers
    
    expected = {
      :A => '1',
      :B => '0',
      :C => '2',
      :D => '5'
    }

    assert_equal expected, offset.generate_offset_numbers
  end
end
