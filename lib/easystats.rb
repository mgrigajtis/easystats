class Easystats
  def self

  end

  # take in an array of numbers and calculate the sum
  def sum(data)
    sum_of_numbers = 0

    data.each do |num|
      sum_of_numbers += num
    end

    sum_of_numbers
  end

  # take in an array of numbers and calculate the mean (average)
  def mean(data)
    self.sum(data) / data.count
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

  # take in the array of numbers and calculate the median
  def median(data)
    halfway = data.count / 2

    # Sort the array
    data = data.sort

    # The median will be different based on the number of numbers in the array
    # If there is an even number in the array
    if(data.count % 2) == 0
      median = (data[halfway] + data[halfway-1]) / 2.0

    # Else, there is an odd number in the array
    else
      median = data[halfway]
    end

    median
  end

  # take in an array of numbers and calculate the range
  def range(data)
    # Sort the array
    data = data.sort
    data[data.count-1] - data[0]
  end
end

