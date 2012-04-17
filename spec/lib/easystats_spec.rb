require 'spec_helper'

describe Array do
  DELTA = 0.00000000000001

  it { should respond_to :average }

  build_stats_spec [], {
    :mean => nil,
    :median => nil,
    :mode => nil,
    :range => nil,
    :standard_deviation => nil,
    :sum => nil,
    :variance => nil
  }

  build_stats_spec [0], {
    :mean => 0,
    :median => 0,
    :mode => 0,
    :range => 0,
    :standard_deviation => 0,
    :sum => 0,
    :variance => 0.0
  }

  build_stats_spec [1], {
    :mean => 1,
    :median => 1,
    :mode => 1,
    :range => 0,
    :standard_deviation => 0,
    :sum => 1,
    :variance => 0.0
  }

  build_stats_spec [1,2], {
    :mean => 1.5,
    :median => 1.5,
    :mode => nil,
    :range => 1,
    :standard_deviation => 0.707106781186548,
    :sum => 3,
    :variance => 0.25
  }

  build_stats_spec [1,2,3], {
    :mean => 2,
    :median => 2,
    :mode => nil,
    :range => 2,
    :standard_deviation => 1,
    :sum => 6,
    :variance => 2.0 / 3.0
  }

  build_stats_spec [1,2,3,4], {
    :mean => 2.5,
    :median => 2.5,
    :mode => nil,
    :range => 3,
    :standard_deviation => 1.29099444873581,
    :sum => 10,
    :variance => 1.25
  }


  build_stats_spec [1,2,2,4], {
    :mean => 2.25,
    :median => 2,
    :mode => 2,
    :range => 3,
    :standard_deviation => 1.2583057392117916,
    :sum => 9,
    :variance => 1.1875
  }


  build_stats_spec [1,3,3,4], {
    :mean => 2.75,
    :median => 3,
    :mode => 3,
    :range => 3,
    :standard_deviation => 1.2583057392117916,
    :sum => 11,
    :variance => 1.1875
  }

  build_stats_spec (0..100).to_a, {
    :mean => 50,
    :median => 50,
    :mode => nil,
    :range => 100,
    :standard_deviation => 29.300170647967224,
    :sum => 5050,
    :variance => 850.0
  }

  build_stats_spec (1..100).to_a, {
    :mean => 50.5,
    :median => 50.5,
    :mode => nil,
    :range => 99,
    :standard_deviation => 29.011491975882016,
    :sum => 5050,
    :variance => 833.25
  }

  build_stats_spec [-1,0,1], {
    :mean => 0,
    :median => 0,
    :mode => nil,
    :range => 2,
    :standard_deviation => 1,
    :sum => 0,
    :variance => 0.6666666666666666
  }

  build_stats_spec [1,2.5], {
    :mean => 1.75,
    :median => 1.75,
    :mode => nil,
    :range => 1.5,
    :standard_deviation => 1.0606601717798212,
    :sum => 3.5,
    :variance =>0.5625
  }
end

