class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, money)
    @name = name
    @height = height
    @spending_money = money.gsub("$", "").to_i
    @preferences = []
    @riden_rides = {}
    @starting_money = money.gsub("$", "").to_i
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(given_height)
    @height >= given_height
  end

  def pay_for_ride(admission_fee)
    @spending_money -= admission_fee
  end

  def riding(ride)
    if @riden_rides[ride] == nil
      @riden_rides[ride] = 1
    else
      @riden_rides[ride] += 1
    end
  end

  def favorite_ride
    favorite_rides = @riden_rides.max_by do |k,v|
      v
    end
    favorite_rides.first
  end

  def money_spent 
    @starting_money - @spending_money
  end
end