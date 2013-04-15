class Array
  def mean
    return if empty?

    sum / count.to_f
  end unless method_defined? :mean

  alias_method :average, :mean unless method_defined? :average

  def weighted_moving_average
    return if empty?
    return first if one?
    weighted_sum = 0
    sum = 0
    index = 0
    each do |element|
      weighted_sum = weighted_sum + (index * element)
      sum += index
      index += 1
    end
    weighted_sum.to_f / sum
  end unless method_defined? :weighted_moving_average

  def median
    return if empty?

    data = sort

    halfway = data.count / 2

    if data.count.even?
      (data[halfway] + data[halfway - 1]) / 2.0
    else
      data[halfway]
    end
  end unless method_defined? :median

  def mode
    return if empty?
    return first if one?
    return if self == uniq

    frequencies = inject(Hash.new(0)) { |k,v| k[v] += 1; k }
    frequencies = frequencies.sort_by { |k,v| v }

    return if frequencies[-1][1] == frequencies[-2][1]

    frequencies.last[0]
  end unless method_defined? :mode

  def probability_distribution
    return if empty?

    total = count.to_f

    uniq.inject({}) { |result, item|
      result.update({ item => count(item) / total })
    }
  end unless method_defined? :probability_distribution

  def range
    return if empty?

    max - min
  end unless method_defined? :range

  def standard_deviation
    return if empty?
    return 0 if one?

    Math::sqrt sum_of_deviations_squared / (count - 1)
  end unless method_defined? :standard_deviation

  def sum
    reduce :+
  end unless method_defined? :sum

  def variance
    return if empty?

    sum_of_deviations_squared / count.to_f
  end unless method_defined? :variance

  protected

  def sum_of_deviations_squared
    mean = self.mean

    inject(0) { |total, number| total + ((number - mean) ** 2) }
  end
end
