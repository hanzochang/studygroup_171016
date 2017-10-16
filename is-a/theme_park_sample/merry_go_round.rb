class MerryGoRound
  def initialize(rides, speed)
    @rides = rides
    @speed = speed
    @angle = 0
  end

  def tick
    @rides.each(&:tick)
    @angle += speed
  end

  def speed
    @speed * PI
  end
end

class Ride
  UPPER = 100

  def initialize(top)
    @top = top
    @go_up = true
  end

  def tick
    @go_up ? up : down
  end

  def up
    @top += up_per_sec
    return if @top > UPPER
    @top = UPPER
    @go_up = false
  end

  def down
    @top += down_per_sec
    return if @top < 0
    @top = 0
    @go_up = true
  end

  private

  def up_per_sec
    raise NotImplementedError
  end

  def down_per_sec
    raise NotImplementedError
  end
end

class RideGennie < Ride
  # 独自のbody装飾パラメータ

  private

  def up_per_sec
    4
  end

  def down_per_sec
    2
  end
end

class RideHorse < Ride
  # 独自のbody装飾パラメータ

  private

  def up_per_sec
    6
  end

  def down_per_sec
    8
  end
end

# ################
# main
# ################

rides = [
  RideHorse.new, RideGennie.new ...
]

MerryGoRound.new(rides, 0.2)
