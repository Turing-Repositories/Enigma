require "date"

class Offset
  attr_reader :date

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def date_squared
    (todays_date.to_i ** 2).to_s.slice(-4..-1) #grabs the numbers in the last 4 positions
  end

end
