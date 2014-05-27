def nil_keys?(original, options={flag: false})
  flag = options[:flag]
  if original.is_a?(Hash)
    keys = original.keys
    keys.each do |key|
      flag = flag || nil_keys?(key, {flag: flag})
    end
  else
    flag = flag || original.nil?
  end
  flag
end

def nil_values?(original, options={flag: false})
  flag = options[:flag]
  if original.is_a?(Hash)
    values = original.values
    values.each do |key|
      flag = flag || nil_values?(key, {flag: flag})
    end
  else
    flag = flag || original.nil?
  end
  flag
end

h = {:a=>1, :b=>2, :d=>{:c=>nil}}
puts nil_values?(h,{flag: false})
