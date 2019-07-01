class Oystercard
  attr_reader :balance, :in_journey

  OYSTER_CAP = 90.0
  MINIMUM_BALANCE = 1.0

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount = 0)
    raise "Oyster balance cannot exceed #{OYSTER_CAP} GBP" if (@balance + amount) > OYSTER_CAP
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(station = "Default")
    raise "Insufficient Balance" if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out(station = "Default")
    @in_journey = false
  end

end
