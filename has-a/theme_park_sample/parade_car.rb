# テーマパークの車の種類＞車の構成オブジェクトと仮定する
# また組み合わせをたくさん見せたいとする
# その場合車の種類を継承でたくさん作るより
# パーツの組み合わせを柔軟に利用できる形の方が破綻しない
#
# ちなみにこれは雰囲気コードなので動かない

END_POS = 100_000

class ParadeCar
  def initialize(start_pos, dancers, body, lights, chassis)
    @start_pos = start_pos
    @dancers = dancers
    @body = body
    @lights = lights
    @chassis = chassis
  end

  def tick
    @dancers.tick
    @body.tick
    @lights.tick
    @chassis.tick
  end

  def goaled?
    @start_pos >= END_POS
  end
end

module EquipmentFactory
  def self.build(equips)
    Equip.new(
      equips: equips.map do |e|
        klass: e[0],
        num: e[1],
        attr: e[2]
      end.flatten
    )
  end

  def self.create(klass, num, attr)
    instances = []
    num.times { instances << klass.new(attr) }
    instances
  end
end

class Equip
  def initialize(equips)
    @equips
  end

  def tick
    @equips.each(&:tick)
  end
end

class Dancer
  # @param [Hash] choreography 振り付けのhash化したjson
  def initialize(attr)
    @choreography = attr[:choreography]
    @costume = attr[:costume]
    @sex = attr[:sex]
    @count = 0
  end

  def tick
    dance(@cheography, @count)
    @count += 1
  end

  private

  def dance(choreography, count)
    # jsonを元に振り付けを動かす処理
  end
end

class Light
  def initialize(attr)
    @toggle = false
    @color = attr[:color]
  end

  def tick
    # ライトを光らせる処理
  end
end

class Body
  # 略
  def tick
    # 略
  end
end

class Chassis
  # 略
  def tick
    # 略
  end
end


# #####################################
# main
# #####################################

cars = []
cars << ParadeCar.new(
  start_pos: -100,
  dancers:
    EquipmentFactory.build(
      [Dancer, 2, { sex: :men, choreograpy: JSON.parse(summer_a_1), costume: :summer }]
      [Dancer, 5, { sex: :women, choreograpy: JSON.parse(summer_a_b), costume: :summer }],
    ),
  body:
    EquipmentFactory.build(
      [Body, 1, awesome_params]
    ),
  lights:
    EquipmentFactory.build(
      [Light, 100, %i(red green blue white black).sample]
    ),
  chassis:
    EquipmentFactory.build(
      [Body, 1, awesome_params]
    )
)

## こんなノリで50種類くらいのパレードカーを作る

loop do
  cars.tick  # パレードカー動かす
  break if cars.each(&:goaled?).all? # 全ての車がゴールを通過したらパレード終了
end
