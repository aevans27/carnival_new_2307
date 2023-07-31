class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log, :total_rides
  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = {}
    @total_rides = 0
  end

  def board_rider(visitor)
    if visitor.spending_money >= @admission_fee && visitor.preferences.include?(@excitement) && visitor.height >= @min_height
      visitor.pay_for_ride(@admission_fee)
      @total_revenue += @admission_fee
      if @rider_log[visitor] == nil
        @rider_log[visitor] = 1
      else
        @rider_log[visitor] += 1
      end
      @total_rides += 1
    end
  end
end