# コンポジションを使いBicycleを作成する例

class Bicycle
  attr_reader :size, :parts

  def initialize(args = {})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

require 'forwardable'
class Part
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  # @param [Array]
  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare}
  end
end

require 'ostruct'
module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.collect { |part_config|
        create_part(part_config)
      }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name: part_config[0],
      description: part_config[1].
      needs_spare: part_config.fetch(2, true)
    )
  end
end


# #####################################
# main
# #####################################

road_config =[
  ['chain', '10-speed'],
  ['tire_size', '23'],
  ['tape_color', 'red']
]

mountain_config =[
  ['chain', '10-speed'],
  ['tire_size', '2.1'],
  ['front_shock', 'Manitou', false],
  ['rear_shock', 'Fox']
]

road_bike = Bycycle.new(
  size: 'L',
  parts: PartsFactory.build(road_config)
)

road_bike.spares

mountain_bike = Bycycle.new(
  size: 'L',
  parts: PartsFactory.build(mountain_config)
)

mountain_bike.spares