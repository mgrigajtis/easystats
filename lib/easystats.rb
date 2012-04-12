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
  end unless method_defined? :median

  # take in an array of numbers and return the mode
  def mode
    return if self.empty?

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
