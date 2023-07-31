class Carnival
  attr_reader :duration, :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def ride_a_ride(selected_ride, visitor)
    @rides.each do |ride|
      if ride == selected_ride
        ride.board_rider(visitor)
      end
    end
  end

  def most_popular_ride
    most_popular_ride = nil
    most_rides = 0
    @rides.each do |ride|
      if ride.total_rides > most_rides
        most_rides = ride.total_rides
        most_popular_ride = ride
      end
    end
    most_popular_ride
  end

  def most_profitable_ride
    most_profitable = nil
    money_earned = 0
    @rides.each do |ride|
      if ride.total_revenue > money_earned
        most_profitable = ride
        money_earned = ride.total_revenue
      end
    end
    most_profitable
  end

  def total_revenue
    total_rev = 0
    @rides.each do |ride|
      total_rev += ride.total_revenue
    end
    total_rev
  end
end