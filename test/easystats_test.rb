require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class EasystatsTest < Test::Unit::TestCase
  
  def test_mean
    assert_equal 1,         [1].mean, "1"
    assert_equal 1.5,     [1,2].mean, "1,2"
    assert_equal 2,     [1,2,3].mean, "1,2,3"
    assert_equal 2.5, [1,2,3,4].mean, "1,2,3,4"
  end
  
  def test_average_synonym_for_mean
    assert_equal 2.5, [1,2,3,4].average, "1,2,3,4"
  end
  
  def test_median
    assert_equal 1,         [1].median, "1"
    assert_equal 1.5,     [1,2].median, "1,2"
    assert_equal 2,     [1,2,3].median, "1,2,3"
    assert_equal 2.5, [1,2,3,4].median, "1,2,3,4"
    assert_equal 2,   [1,2,2,4].median, "1,2,2,4"
    assert_equal 3,   [1,3,3,4].median, "1,3,3,4"
  end
  
  def test_mode
    assert_equal   1,       [1].mode, "1"
    assert_equal nil,     [1,2].mode, "1,2"
    assert_equal nil,   [1,2,3].mode, "1,2,3"
    assert_equal nil, [1,2,3,4].mode, "1,2,3,4"
    assert_equal   2, [1,2,2,4].mode, "1,2,2,4"
    assert_equal   3, [1,3,3,4].mode, "1,3,3,4"
  end
  
  def test_range
    assert_equal 0,       [1].range, "1"
    assert_equal 1,     [1,2].range, "1,2"
    assert_equal 2,   [1,2,3].range, "1,2,3"
    assert_equal 3, [1,2,3,4].range, "1,2,3,4"
    assert_equal 3, [1,2,2,4].range, "1,2,2,4"
    assert_equal 3, [1,3,3,4].range, "1,3,3,4"
  end
  
  def test_sum
    assert_equal  1,         [1].sum, "1"
    assert_equal  3,       [1,2].sum, "1,2"
    assert_equal  6,     [1,2,3].sum, "1,2,3"
    assert_equal 10,   [1,2,3,4].sum, "1,2,3,4"
    assert_equal  9,   [1,2,2,4].sum, "1,2,2,4"
    assert_equal 11,   [1,3,3,4].sum, "1,3,3,4"
  end
  
  def test_variance
    assert_equal 0.0,           [1].variance, "1"
    assert_equal 0.25,        [1,2].variance, "1,2"
    assert_equal 2.0/3.0,   [1,2,3].variance, "1,2,3"
    assert_equal 1.25,    [1,2,3,4].variance, "1,2,3,4"
  end
  
  def test_standard_deviation
    delta = 0.00000000000001
    assert_in_delta 0,                       [1].standard_deviation, delta, "1"
    assert_in_delta 0.707106781186548,     [1,2].standard_deviation, delta, "1,2"
    assert_in_delta 1,                   [1,2,3].standard_deviation, delta, "1,2,3"
    assert_in_delta 1.29099444873581,  [1,2,3,4].standard_deviation, delta, "1,2,3,4"
  end
  
  def test_should_not_be_able_to_access_protected_method_sum_of_deviations_squared
    assert_raise(NoMethodError) do
      [1].sum_of_deviations_squared
    end
  end
  
end
