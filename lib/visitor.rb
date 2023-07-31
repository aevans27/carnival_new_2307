class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, money)
    @name = name
    @height = height

    @spending_money = money.gsub("$", "").to_i
    @preferences = []
  end

  def add_preferences(preference)
    @preferences << preference
  end

  def tall_enough?(given_height)
    @height >= given_height
  end
end