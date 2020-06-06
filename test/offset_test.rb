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
end
