require './test/test_helper.rb'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
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

    assert_equal last_4_digits_of_squared_date, offset.date_squared
  end

  def test_it_can_generate_offset_numbers
    offset = Offset.new
    date = Date.today.strftime("%d%m%y")
    last_4_digits_of_squared_date = (date.to_i ** 2).to_s.slice(-4..-1)
    numbers = last_4_digits_of_squared_date

    expected = {
      :A => numbers[0],
      :B => numbers[1],
      :C => numbers[2],
      :D => numbers[3]
    }

    assert_equal expected, offset.generate_offset_numbers
  end
end
