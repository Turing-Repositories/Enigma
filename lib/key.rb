class Key
  attr_reader :key_set_numbers

  def initialize(key_set_numbers = random_key_numbers)
    @key_set_numbers = key_set_numbers
  end


  def random_key_numbers #create a random 5 digit number
    rand(0..99999).to_s
  end

  def generate_key_set_numbers
    keys = Hash.new(0)
    keys[:A] = key_set_numbers[0..1]
    keys[:B] = key_set_numbers[1..2]
    keys[:C] = key_set_numbers[2..3]
    keys[:D] = key_set_numbers[3..4]
    keys
  end
end
