puts RUBY_DESCRIPTION

if RUBY_DESCRIPTION.start_with? "ruby 1.9"
  require 'simplecov'
  SimpleCov.start
end

require 'easystats'

def build_stats_spec(array, expectations)
  expectations.each do |method, expectation|
    describe "##{method}" do
      context "when #{array.inspect}" do
        if expectation && method == :standard_deviation
          it "should be within #{DELTA} of #{expectation.inspect}" do
            array.send(method).should be_within(DELTA).of(expectation)
          end
        else
          it "should be #{expectation.inspect}" do
            array.send(method).should == expectation
          end
        end
      end
    end
  end
end

