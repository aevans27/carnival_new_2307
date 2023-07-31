require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it "Initialize and get data" do
    @carnival = Carnival.new(14)
    expect(@carnival.duration).to eq(14)
    expect(@carnival.rides).to eq([])
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @carnival.add_ride(ride1)
    expect(@carnival.rides).to eq([ride1])
  end

  it "Check most profitalable" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)

    @carnival.ride_a_ride(@ride1, @visitor1)
    @carnival.ride_a_ride(@ride1, @visitor1)
    @carnival.ride_a_ride(@ride1, @visitor2)
    @carnival.ride_a_ride(@ride3, @visitor1)
    @carnival.ride_a_ride(@ride3, @visitor2)
    @carnival.ride_a_ride(@ride3, @visitor3)

    expect(@carnival.rides[0].rider_log).to eq({@visitor1 => 2, @visitor2 => 1})
    expect(@carnival.rides[2].rider_log).to eq({@visitor3 => 1})
    expect(@carnival.most_popular_ride).to eq(@ride1)
    expect(@carnival.most_profitable_ride).to eq(@ride1)
    expect(@carnival.total_revenue).to eq(5)
  end
end