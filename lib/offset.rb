require_relative 'reuseables'
class Offset
  def initialize
    @offset_numbers = offset_numbers
    @offest_numbers_hash = generate_offset_numbers
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def date_squared
    (todays_date.to_i ** 2).to_s.slice(-4..-1) #grabs the numbers in the last 4 positions
  end

  def offset_numbers
    date_squared
  end

  def generate_offset_numbers
    offset = Hash.new(0)
    offset[:A] = offset_numbers[0]
    offset[:B] = offset_numbers[1]
    offset[:C] = offset_numbers[2]
    offset[:D] = offset_numbers[3]
    offset
  end
end
