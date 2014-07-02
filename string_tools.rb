class StringTools
  def snake_to_camel_case(str)
    s = str.split(/(_|-)/)
    s = s.select { |m| m=~/[a-zA-Z]/ }.map { |m| m.capitalize }.join("")
    s
  end
  def camel_to_snake_case(str)
    str.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end