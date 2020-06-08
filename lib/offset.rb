require_relative 'reuseables'
class Offset
  include Reuseables
  attr_reader :offset_numbers

  def initialize(offset_numbers = random_key_numbers)
    @offset_numbers = offset_numbers
    @offest_numbers_hash = generate_offset_numbers
  end

  def square_offset_numbers
    (@offset_numbers.to_i**2).to_s.slice(-4..-1)
  end

  def generate_offset_numbers
    offset = Hash.new(0)
    offset[:A] = square_offset_numbers[0]
    offset[:B] = square_offset_numbers[1]
    offset[:C] = square_offset_numbers[2]
    offset[:D] = square_offset_numbers[3]
    offset
  end
end
