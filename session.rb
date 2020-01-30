class Session
  MORNING_SESSION_LENGTH = 180
  AFTERNOON_SESSION_LENTH = (180..240)

  def schedule
      durations = ObjectSpace.each_object(Event).map(&:duration)
      first_half = (1..durations.count).map {|n| durations.combination(n).each.find_all {|d| d.reduce(:+) == 180} }.reject(&:empty?).flatten(1).uniq
      second_half = (1..durations.count).map {|n| durations.combination(n).each.find_all {|d| d.reduce(:+) >= 180 && d.reduce(:+) <= 240} }.reject(&:empty?).flatten(1).uniq
  end
end