class Easystats
  def self

  end

  # take in an array of numbers and calculate the mean (average)
  def mean(data)
    sum_of_numbers = 0

    data.each do |num|
      sum_of_numbers += num
    end

    sum_of_numbers / data.count
  end

  # take in an array of numbers and calculate the standard deviation
  def standard_deviation(data)
    average = self.mean(data)
    deviations = Array.new
    sum_of_deviations = 0

    data.each do |num|
      deviations.push((num-average)**2)
    end

    deviations.each do |num|
      sum_of_deviations += num
    end

    Math::sqrt(sum_of_deviations / (data.count-1))
  end
end

