require './lib/visitor'

RSpec.describe Visitor do
  it "initialize and get data" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
    visitor1.add_preferences(:gentle)
    visitor1.add_preferences(:thrilling)
    expect(visitor1.preferences).to eq([:gentle, :thrilling])
  end

  it "more visitors and check height" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    expect(visitor1.tall_enough?(54)).to eq(true)
    expect(visitor2.tall_enough?(54)).to eq(false)
    expect(visitor3.tall_enough?(54)).to eq(true)
    expect(visitor1.tall_enough?(64)).to eq(false)
  end
end