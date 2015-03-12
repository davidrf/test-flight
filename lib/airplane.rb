class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :fuel

  def initialize(type, wing_loading, horsepower, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine_started = false
    @flying = false
    @fuel = fuel
  end

  def start
    if fuel < 10
      "need 10 gallons of fuel to start"
    elsif @engine_started
      @fuel -= 10
      "airplane already started"
    else
      @engine_started = true
      "airplane started"
    end
  end

  def takeoff
    if @engine_started && @fuel < 100
      "need 100 gallons of fuel to takeoff"
    elsif @engine_started
      @fuel -= 100
      @flying = true
      "airplane launched"
    else
      "airplane not started, please start"
    end
  end

  def land
    if @engine_started && @flying && @fuel < 50
      "need 50 gallons of fuel to land"
    elsif @engine_started && @flying
      @flying = false
      "airplane landed"
    elsif @engine_started
      "airplane already on the ground"
    else
      "airplane not started, please start"
    end
  end
end
