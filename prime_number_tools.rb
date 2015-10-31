class PrimeNumberTools
  attr_accessor :prime_list
  
  def initialize
  end

  def sieve_of_eratosthenes(n)
    #find all primes <= n, 1 is prime, 0 is composite
    @prime_list = Array.new((0..n).map { |m| m}.length-1, 1)
    m = Math.sqrt(n).floor
    (2..m).each do |i|
      if @prime_list[i]==1
        j = i
        while (j*i<n)
          @prime_list[j*i] = 0
          j = j + 1
        end
      end
    end
    @prime_list
  end

end
