# アトラクションの現在の平均待ち時間を算出する振る舞い
# アトラクションごとの振る舞い同士は大きく乖離、
# だが、待ち時間の概算ロジックはどこのアトラクションもほぼ同じ-> behaves_like_a

module WaitingTimeCalcuratable
  def waiting_time
    waiting_people_num / rideable_per_minute * error_range
  end

  def waiting_people_num
    TDRWaitingPeopleAPI.request(self.class.underscore)
  end
end

class SprashMoutain
  include WaitingTimeCalcuratable

  # 略

  def ridable_per_minute
    24.0
  end

  # 捌ける理論値における平均誤差
  def error_range
    0.4
  end
end

class CenterOfTheEarth
  include WaitingTimeCalcuratable

  # 略

  def ridable_per_minute
    18.0
  end

  # 捌ける理論値における平均誤差
  def error_range
    0.6
  end
end
