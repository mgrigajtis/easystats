class Array
  def mean
    return if self.empty?

    self.sum / self.count.to_f
  end unless method_defined? :mean

  alias_method :average, :mean unless method_defined? :average

  def median
    return if self.empty?

    data = self.sort

    halfway = data.count / 2

    if data.count.even?
      (data[halfway] + data[halfway - 1]) / 2.0
    else
      data[halfway]
    end
  end unless method_defined? :median

  def mode
    return if self.empty?
    return self.first if self.one?
    return if self == self.uniq

    frequencies = self.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
    frequencies = frequencies.sort_by { |k,v| v }

    return if frequencies[-1][1] == frequencies[-2][1]

    frequencies.last[0]
  end unless method_defined? :mode

  def range
    return if self.empty?

    self.max - self.min
  end unless method_defined? :range

  def standard_deviation
    return if self.empty?
    return 0 if self.one?

    Math::sqrt self.sum_of_deviations_squared / (self.count - 1)
  end unless method_defined? :standard_deviation

  def sum
    self.reduce { |total, number| total + number }
  end unless method_defined? :sum

  def variance
    return if self.empty?

    self.sum_of_deviations_squared / self.count.to_f
  end unless method_defined? :variance

  protected

  def sum_of_deviations_squared
    mean = self.mean

    self.inject(0) { |total, number| total + ((number - mean) ** 2) }
  end
end
