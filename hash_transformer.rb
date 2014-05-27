
def hash_test(original,options={},&block)
  original.inject({}){ |result, (key, value)|
   value = value + 2
  
   block.call(result, key, value)
   result
  }
  
end

h={:a=>3, :b=>4}

r = hash_test(h) { |result, key, value| result[key]=value }
puts r #=> {:a=>5, :b=>6}

def transform_hash(original, options={}, &block)
  original.inject({}){|result, (key,value)|
    value = if (options[:deep] && Hash === value) 
              transform_hash(value, options, &block)
            else 
              value
            end
    block.call(result,key,value)
    result
  }
end

g={:a=>[{:b=>3},{:c=>4}], :b=>2}
puts transform_hash(g) { |result, key, value| result[key] = value}

#if no parentheses, you get a:
  # hash_transformer.rb:5:in `block in hash_test': undefined method `+' for nil:NilClass (NoMethodError)
  # from hash_transformer.rb:4:in `each'
  # from hash_transformer.rb:4:in `inject'
  # from hash_transformer.rb:4:in `hash_test'
  # from hash_transformer.rb:15:in `<main>'
