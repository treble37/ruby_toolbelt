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
  def linkenize_email(email)
    email.gsub(/([a-zA-z0-9_-])+@([a-zA-Z])+\.([a-zA-z])+/, "<a href=mailto:#{email}>"+email+"</a>")
  end
  def is_date?(date)
    m = date =~ /[0-9]+\/[0-9]+\/[0-9]+/
    !m.nil?
  end
end

r=RegexTools.new
puts r.linkenize_email("google@google.com")
