# behaves_like_a
# オブジェクト同士では継承やコンポジションによる繋がりはなく
# 全く別種の振る舞いを持つものだが
# 一部の振る舞いが共通し抽象化できる

module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end
end

class Vehicle
  include Schedulable
  # 略

  def lead_days
    3
  end

  # 略
end

class Mechanic
  include Schedulable
  # 略

  def lead_days
    4
  end

  # 略
end

# #####################################
# main
# #####################################

v = Vehicle.new
v.schedulable?(starting, ending)
# This Vehicle is not scheduled
#   between 2015-09-01 and 2015-09-10
#  => true

m = Mechanic.new
m.schedulable?(starting, ending)
# This Mechanic is not scheduled
#   between 2015-02-29 and 2015-09-10
#  => true”

