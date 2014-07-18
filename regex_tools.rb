class RegexTools
  def twenty_four_hour_time?(time)
    m = time=~/([01]?[0-9]|2[0-3]):([0-5][0-9])/
    !m.nil?
  end
end

