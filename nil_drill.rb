require 'active_support/core_ext/object/blank'

def got_nils?(original, options={flag: false, method: :keys})
  ##method: :keys or :values (of a Hash)
  raise ArgumentError, "no method :keys or :values in options" if !(options[:method]==:keys||options[:method]==:values)
  flag = options[:flag]
  if original.is_a?(Hash)
    values = original.send(options[:method])
    values.each do |val|
      flag = flag || got_nils?(val, {flag: flag, method: options[:method]})
    end
  else
    flag = flag || original.nil?
  end
  flag
end

def nil_substituter(nested_hash, options={default: ""})
  #iterate through nested hash and if a nil is encountered, substitute value
  #default key is always an option
  #other keys in options hash should match up to keys in nested_hash if you want to substitute that key's value
  return nil if !nested_hash.is_a?(Hash)
  nested_hash.each do |key, value|
    if value==nil
      nested_hash[key] = options[:default] || options[key]
    elsif value.is_a?(Hash)
      nil_substituter(nested_hash[key])
    end
  end
  nested_hash
end

def nested_hash_keys(nested_hash)
  #return array of keys
  return nil if !nested_hash.is_a?(Hash)
  keys = nested_hash.keys
  nested_keys = []
  keys.each do |key|
    nested_keys << nested_hash_keys(nested_hash[key])
  end
  keys << nested_keys
  keys.flatten!.reject { |k| k==nil }
end

g = {:a=>{:b=>nil, :c=>{:d=>nil}}, :e=>{:f=>{:g=>{:h=>nil}}}}

# c = [:a, :b]
# p nil_substituter(g, options={default: ""}, *c)

p nil_substituter(g, options={default: ""})

h = {:a=>1, :b=>2, :d=>{:c=>nil}}
p got_nils?(h, options = {flag: false, method: :values})

