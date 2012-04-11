class Array
  # take in an array of numbers and calculate the mean (average)
  def mean
    return unless self.any?

    self.sum / self.count.to_f
  end unless Array.instance_methods.include? "mean"
  alias_method :average, :mean unless Array.instance_methods.include? "average"

  # take in the array of numbers and calculate the median
  def median
    return unless self.any?

    data = self

    halfway = data.count / 2

    # Sort the array
    data = data.sort

    # The median will be different based on the number of numbers in the array
    # If there is an even number in the array
    if(data.count % 2) == 0
      median = (data[halfway] + data[halfway-1]) / 2.0

    # Else, there is an odd number of elements in the array
    else
      median = data[halfway]
    end

    median
  end unless Array.instance_methods.include? "median"

  # take in an array of numbers and return the mode
  def mode
    return unless self.any?

    # Sort the array
    data = self.sort

    # create a flag to tell the user if all the numbers only appear once
    no_mode = true

    # The variable that will hold the highest number
    highest_value = 0

    # The variable that holds the most time the value appears
    most_times = 0

    # Create a new hash to hold the numbers
    tmp = Hash.new

    # Populate the hash
    data.each do |num|
      if tmp["#{num}"].nil? == false
        tmp["#{num}"] = tmp["#{num}"].to_i + 1
      else
        tmp["#{num}"] = 1
      end
    end

    # Check to make sure that there is a mode
    data.each do |num|
      if tmp["#{num}"].to_i > 0
        no_mode = false
      end
    end

    if no_mode == true
      nil
    else
      data.each do |num|
        if tmp["#{num}"].to_i > most_times
          highest_value = num
          most_times = tmp["#{num}"]
        end
      end

      # now loop through again just to make sure another number doesn't appear an equal number of times
      data.each do |num|
        if num != highest_value
          if tmp["#{num}"].to_i == most_times
            no_mode = true
          end
        end
      end

      if no_mode == true
        nil
      else
        highest_value
      end
    end
  end unless Array.instance_methods.include? "mode"

  # take in an array of numbers and calculate the range
  def range
    return unless self.any?

    data = self.sort
    data.last - data.first
  end unless Array.instance_methods.include? "range"

  # take in an array of numbers and calculate the standard deviation
  def standard_deviation
    return unless self.any?
    return 0 if self.one?

    Math::sqrt(self.sum_of_deviations_squared / (self.count-1))
  end unless Array.instance_methods.include? "standard_deviation"

  # take in an array of numbers and calculate the sum
  def sum
    self.reduce { |total, number| total + number }
  end unless Array.instance_methods.include? "sum"

  def variance
    return unless self.any?

    sum_of_deviations = self.sum_of_deviations_squared

    sum_of_deviations / self.count.to_f
  end unless Array.instance_methods.include? "variance"

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
