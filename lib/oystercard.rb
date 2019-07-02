class Oystercard
  attr_reader :balance, :in_journey, :name, :entry_station, :list_journeys

  MAXIMUM_BALANCE = 90.0
  MINIMUM_BALANCE = 1.0
  MINIMUM_FARE = 1.0

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount = 0)
    raise "Oyster balance cannot exceed #{MAXIMUM_BALANCE} GBP" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey
    !@entry_station.nil?
  end

  def touch_in(station = 'Default')
    raise 'Insufficient Balance' if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station = 'Default')
    deduct
    @journeys.push({:entry_station => @entry_station, :exit_station => station})
    @entry_station = nil
  end

  def list_journeys
    @journeys
  end

  private

  def deduct(amount = MINIMUM_FARE)
    @balance -= amount
  end

end
