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
    self.sum(data) / data.count.to_f
  end

  # this is an internat function (technically the developer can use it but should have no need)
  # this function returns the sum of each squared difference of mean
  def sum_of_deviations_squared(data)
    deviations = Array.new
    average = self.mean(data)
    sum_of_deviations = 0

    data.each do |num|
      deviations.push((num-average)**2)
    end

    deviations.each do |num|
      sum_of_deviations += num
    end

    sum_of_deviations
  end

  # take in an array of numbers and calculate the standard deviation
  def standard_deviation(data)
    sum_of_deviations = self.sum_of_deviations_squared(data)

    Math::sqrt(sum_of_deviations / (data.count-1))
  end

  def variance(data)
    average = self.mean(data)
    sum_of_deviations = self.sum_of_deviations_squared(data)
    sum_of_deviations / data.count.to_f
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

    # Else, there is an odd number of elements in the array
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

  # take in an array of numbers and return the mode
  def mode(data)
    # Sort the array
    data = data.sort

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
      if tmp["#{num}"].to_i > 1
        no_mode = false
      end
    end
 
    if no_mode == true
      "There is no mode"
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
        "There is no mode"
      else
        highest_value
      end
    end
  end
end
