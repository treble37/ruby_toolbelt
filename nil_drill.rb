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

h = {:a=>1, :b=>2, :d=>{:c=>nil}}
p got_nils?(h,options = {flag: false, method: :values})
