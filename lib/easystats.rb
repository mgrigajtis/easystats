class Array
  # take in an array of numbers and calculate the mean (average)
  def mean
    return if self.empty?

    self.sum / self.count.to_f
  end unless method_defined? :mean

  alias_method :average, :mean unless method_defined? :average

  # take in the array of numbers and calculate the median
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

  # take in an array of numbers and return the mode
  def mode
    return if self.empty?
    return self.first if self.one?
    return if self == self.uniq

    frequencies = self.reduce(Hash.new(0)) { |k,v| k[v] += 1; k }
    frequencies = frequencies.sort_by { |k,v| v }

    return if frequencies[-1][1] == frequencies[-2][1]

    frequencies.last[0]
  end unless method_defined? :mode

  # take in an array of numbers and calculate the range
  def range
    return if self.empty?

    data = self.sort
    data.last - data.first
  end unless method_defined? :range

  # take in an array of numbers and calculate the standard deviation
  def standard_deviation
    return if self.empty?
    return 0 if self.one?

    Math::sqrt(self.sum_of_deviations_squared / (self.count-1))
  end unless method_defined? :standard_deviation

  # take in an array of numbers and calculate the sum
  def sum
    self.reduce { |total, number| total + number }
  end unless method_defined? :sum

  def variance
    return if self.empty?

    self.sum_of_deviations_squared / self.count.to_f
  end unless method_defined? :variance

  protected

  # this function returns the sum of each squared difference of mean
  def sum_of_deviations_squared
    data = self

    deviations = Array.new
    average = self.mean
    sum_of_deviations_squared = 0

    data.each do |num|
      deviations.push((num-average)**2)
    end

    deviations.each do |num|
      sum_of_deviations_squared += num
    end

    sum_of_deviations_squared
  end
end
