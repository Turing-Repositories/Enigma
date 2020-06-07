require_relative 'reuseables'
class Offset
  include Reuseables
  def initialize
    @offset_numbers = offset_numbers
    @offest_numbers_hash = generate_offset_numbers
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
