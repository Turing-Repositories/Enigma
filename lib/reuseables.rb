require 'date'
module Reuseables

  def random_key_numbers #create a random 5 digit number
    rand(0..99999).to_s.rjust(5,'0')
  end

  def alphabet
    ('a'..'z').to_a << ' '
  end

  def shift_alphabet_letter(index, amount_of_shift)
    return alphabet.rotate(amount_of_shift[:A]) if index % 4 == 0
    return alphabet.rotate(amount_of_shift[:B]) if index % 4 == 1
    return alphabet.rotate(amount_of_shift[:C]) if index % 4 == 2
    return alphabet.rotate(amount_of_shift[:D]) if index % 4 == 3
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def date_squared
    (todays_date.to_i ** 2).to_s.slice(-4..-1)
  end

  def offset_numbers
    date_squared
  end
end
