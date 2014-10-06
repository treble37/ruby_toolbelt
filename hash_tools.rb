class HashTools < Hash
  
  def ::[]
    super
  end

  def [](key)
    key.respond_to?(:upcase) ? super(key.upcase) : super(key)
  end

  def []=(key, value)
    key.respond_to?(:upcase) ? super(key.upcase, value) : super(key, value)
  end

  def has_key?(key)
    key.respond_to?(:upcase) ? super(key.upcase) : super(key)
  end

  def fetch(key)
    key.respond_to?(:upcase) ? super(key.upcase) : super(key)
  end
end

h = HashTools[{"a"=>1}]
puts h["A"]
