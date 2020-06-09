require 'date'
module Reuseables

  # Encrypt.rb && Decrypt.rb
  def shift_alphabet_letter(index, amount_of_shift)
    return alphabet.rotate(amount_of_shift[:A]) if (index % 4).zero?
    return alphabet.rotate(amount_of_shift[:B]) if index % 4 == 1
    return alphabet.rotate(amount_of_shift[:C]) if index % 4 == 2
    return alphabet.rotate(amount_of_shift[:D]) if index % 4 == 3
  end

  def format_message(message)
    message.downcase
  end

  def alphabet
    ('a'..'z').to_a << ' '
  end

  # Key.rb
  def random_key_numbers
    rand(0..99_999).to_s.rjust(5,'0')
  end

  def key
    Key.new.generate_key_set_numbers
  end

  # Offset.rb
  def offset
    Offset.new.generate_offset_numbers
  end

  # Date Info
  def date_squared
    (todays_date.to_i**2).to_s.slice(-4..-1)
  end

  def todays_date
    Date.today.strftime('%d%m%y')
  end
end
