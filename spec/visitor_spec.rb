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
end