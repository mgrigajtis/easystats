require 'spec_helper'

describe Array do
  DELTA = 0.00000000000001

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

  # TODO: Finish porting specs below to style above

  describe "#mean" do
    it {        [].mean.should be_nil }
    it {       [1].mean.should ==   1 }
    it {     [1,2].mean.should == 1.5 }
    it {   [1,2,3].mean.should ==   2 }
    it { [1,2,3,4].mean.should == 2.5 }
    it {  [-1,0,1].mean.should ==   0 }
    it { [1.0,2.5].mean.should == 1.75 }
  end

  describe "#average" do
    it { [1,2,3,4].average.should == 2.5 }
  end

  describe "#median" do
    it {        [].median.should be_nil }
    it {       [1].median.should ==   1 }
    it {     [1,2].median.should == 1.5 }
    it {   [1,2,3].median.should ==   2 }
    it { [1,2,3,4].median.should == 2.5 }
    it { [1,2,2,4].median.should ==   2 }
    it { [1,3,3,4].median.should ==   3 }
    it {  [-1,0,1].median.should ==   0 }
  end

  describe "#mode" do
    it {        [].mode.should be_nil }
    it {       [1].mode.should ==   1 }
    it {     [1,2].mode.should be_nil }
    it {   [1,2,3].mode.should be_nil }
    it { [1,2,3,4].mode.should be_nil }
    it { [1,2,2,4].mode.should ==   2 }
    it { [1,3,3,4].mode.should ==   3 }
    it {  [-1,0,1].mode.should be_nil }
  end

  describe "#range" do
    it {        [].range.should be_nil }
    it {       [1].range.should == 0 }
    it {     [1,2].range.should == 1 }
    it {   [1,2,3].range.should == 2 }
    it { [1,2,3,4].range.should == 3 }
    it { [1,2,2,4].range.should == 3 }
    it { [1,3,3,4].range.should == 3 }
    it {  [-1,0,1].range.should == 2 }
  end

  describe "#standard_deviation" do
    let(:delta) { 0.00000000000001 }

    it {        [].standard_deviation.should be_nil }
    it {       [1].standard_deviation.should == 0 }
    it {     [1,2].standard_deviation.should be_within(delta).of(0.707106781186548) }
    it {   [1,2,3].standard_deviation.should be_within(delta).of(1) }
    it { [1,2,3,4].standard_deviation.should be_within(delta).of(1.29099444873581) }
    it {  [-1,0,1].standard_deviation.should be_within(delta).of(1) }
  end

  describe "#sum" do
    it {        [].sum.should be_nil }
    it {       [1].sum.should ==  1 }
    it {     [1,2].sum.should ==  3 }
    it {   [1,2,3].sum.should ==  6 }
    it { [1,2,3,4].sum.should == 10 }
    it { [1,2,2,4].sum.should ==  9 }
    it { [1,3,3,4].sum.should == 11 }
    it {  [-1,0,1].sum.should ==  0 }
  end

  describe "#variance" do
    it {        [].variance.should be_nil }
    it {       [1].variance.should ==     0.0 }
    it {     [1,2].variance.should ==    0.25 }
    it {   [1,2,3].variance.should == 2.0/3.0 }
    it { [1,2,3,4].variance.should ==    1.25 }
    it {  [-1,0,1].variance.should == 2.0/3.0 }
  end

  private


end

