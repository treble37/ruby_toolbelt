class ArrayTools
	def multiply(a, b)
		#multiply multi-dimensional matrices represented as arrays, e.g.,  [[1, 2], [3, 2]] * [[1, 2], [3, 2]]
		m = a.length #rows
		n = a[0].length #cols
		q = b[0].length #cols
		result = []
		return -1 if n!=b.length
		(0..m-1).each do |i|
			(0..q-1).each do |j|
				(0..n-1).each do |k|
					result[i] ||= []
					result[i][j] ||= 0
					result[i][j] += a[i][k] * b[k][j]
				end
			end
		end
		result
	end

end

a = ArrayTools.new
c=[[1, 2], [3, 2]]
d=[[3, 2], [1, 1]]
p a.multiply(c,d)

