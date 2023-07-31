class Carnival
  attr_reader :duration, :rides, :visitors
  def initialize(duration)
    @duration = duration
    @rides = []
    @visitors = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def add_visitor(visitor)
    if !@visitors.include?(visitor)
      @visitors << visitor
    end
  end

  def ride_a_ride(selected_ride, visitor)
    @rides.each do |ride|
      if ride == selected_ride
        ride.board_rider(visitor)
        visitor.riding(ride)
      end
    end
    add_visitor(visitor)
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

  def get_visitor_info
    @visitors.map do |visitor|
      {
        visitor: [visitor],
        favorite_ride: [visitor.favorite_ride],
        total_money_spent: [visitor.money_spent]
      }
    end
  end

  def summary
    summary_of_carnival = {
      visitor_count: [@visitors.count],
      revenue_earned: [total_revenue],
      visitors: get_visitor_info,
      rides: []
    }
  end
end