class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_LIMIT = 90.00
  BALANCE = @balance.to_f
  MINIMUM_BALANCE = 1
  FARE = 1

  def initialize
    @balance = 0.00
    @journey_status = false
    @entry_station
  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit of £#{DEFAULT_LIMIT}. Your current balance is £#{@balance}" if limit_reached?(money)

      @balance += money
  end

  def in_journey?
    @journey_status
  end

  def touch_in(station)
    fail "Please top up, not enough credit" if @balance < MINIMUM_BALANCE
    @journey_status = true
    station
  end

  def touch_out
    @journey_status = false
    deduct
  end

private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct
    @balance -= FARE
  end
end
