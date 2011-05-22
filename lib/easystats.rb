class Array

    # take in an array of numbers and calculate the sum
    def sum
      data = self
      sum_of_numbers = 0

      # Get the total sum only if there are actually numbers to total
      if data.count > 0
        data.each do |num|
          sum_of_numbers += num
        end
      else
        sum_of_numbers = 0
      end

      sum_of_numbers
    end unless Array.instance_methods.include? "sum"

    # take in an array of numbers and calculate the mean (average)
    def mean
      data = self

      # Check to make sure there are numbers to avoid division by 0
      if data.count > 0
        self.sum / data.count.to_f
      else
        0
      end
    end unless Array.instance_methods.include? "mean"
    alias_method :average, :mean unless Array.instance_methods.include? "average"

    # take in an array of numbers and calculate the standard deviation
    def standard_deviation
      data = self
      sum_of_deviations_squared = self.sum_of_deviations_squared

      if data.count > 1
        Math::sqrt(sum_of_deviations_squared / (data.count-1))
      else
        0
      end
    end unless Array.instance_methods.include? "standard_deviation"

    def variance
      data = self
      average = self.mean
      sum_of_deviations = self.sum_of_deviations_squared
 
      if data.count > 0
        sum_of_deviations / data.count.to_f
      else
        0
      end
    end unless Array.instance_methods.include? "variance"

    # take in the array of numbers and calculate the median
    def median
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

    # take in an array of numbers and calculate the range
    def range
      data = self
      data = data.sort
      data[data.count-1] - data[0]
    end unless Array.instance_methods.include? "range"

    # take in an array of numbers and return the mode
    def mode
      data = self

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
        if tmp["#{num}"].to_i > 0
          no_mode = false
        end
      end
 
      if no_mode == true
        0
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
    
<<<<<<< HEAD
end
=======
  end
>>>>>>> origin/master
