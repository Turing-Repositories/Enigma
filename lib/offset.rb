require "date"

class Offset
  attr_reader :date

  def todays_date
    Date.today.strftime("%d%m%y")
  end
end
