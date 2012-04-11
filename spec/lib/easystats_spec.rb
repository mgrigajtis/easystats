require 'spec_helper'

describe Array do
  describe "#mean" do
    it {       [1].mean.should ==   1 }
    it {     [1,2].mean.should == 1.5 }
    it {   [1,2,3].mean.should ==   2 }
    it { [1,2,3,4].mean.should == 2.5 }
  end

  describe "#average" do
    it { [1,2,3,4].average.should == 2.5 }
  end

  describe "#median" do
    it {       [1].median.should ==   1 }
    it {     [1,2].median.should == 1.5 }
    it {   [1,2,3].median.should ==   2 }
    it { [1,2,3,4].median.should == 2.5 }
    it { [1,2,2,4].median.should ==   2 }
    it { [1,3,3,4].median.should ==   3 }
  end

  describe "#mode" do
    it {       [1].mode.should ==   1 }
    it {     [1,2].mode.should be_nil }
    it {   [1,2,3].mode.should be_nil }
    it { [1,2,3,4].mode.should be_nil }
    it { [1,2,2,4].mode.should ==   2 }
    it { [1,3,3,4].mode.should ==   3 }
  end

  describe "#range" do
    it {       [1].range.should == 0 }
    it {     [1,2].range.should == 1 }
    it {   [1,2,3].range.should == 2 }
    it { [1,2,3,4].range.should == 3 }
    it { [1,2,2,4].range.should == 3 }
    it { [1,3,3,4].range.should == 3 }
  end

  describe "#sum" do
    it {       [1].sum.should ==  1 }
    it {     [1,2].sum.should ==  3 }
    it {   [1,2,3].sum.should ==  6 }
    it { [1,2,3,4].sum.should == 10 }
    it { [1,2,2,4].sum.should ==  9 }
    it { [1,3,3,4].sum.should == 11 }
  end

  describe "#variance" do
    it {       [1].variance.should ==     0.0 }
    it {     [1,2].variance.should ==    0.25 }
    it {   [1,2,3].variance.should == 2.0/3.0 }
    it { [1,2,3,4].variance.should ==    1.25 }
  end

  describe "#standard_deviation" do
    let(:delta) { 0.00000000000001 }

    it {       [1].standard_deviation.should be_within(delta).of(0) }
    it {     [1,2].standard_deviation.should be_within(delta).of(0.707106781186548) }
    it {   [1,2,3].standard_deviation.should be_within(delta).of(1) }
    it { [1,2,3,4].standard_deviation.should be_within(delta).of(1.29099444873581) }
  end
end


