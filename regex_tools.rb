class RegexTools
  def twenty_four_hour_time?(time)
    m = time=~/([01]?[0-9]|2[0-3]):([0-5][0-9])/
    !m.nil?
  end
  def is_float?(num)
    m = num.to_s =~ /([0-9]*)?\.[0-9]+/
    !m.nil?
  end
  def valid_email?(email)
    email = email.downcase
    m = email =~ /([a-zA-z0-9_-])+@([a-zA-Z])+\.([a-zA-z])+/
    !m.nil?
  end
  def number_commas(n)
    n.to_s.gsub(/(?<=\d)(?=(\d\d\d)+$)/,',')
  end
end

r=RegexTools.new
puts r.number_commas(1234567890)
