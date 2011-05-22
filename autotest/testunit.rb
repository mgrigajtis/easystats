require 'autotest'

class Autotest::Testunit < Autotest
  def initialize
    super
    
    @test_mappings = {
      %r%^test/.*\.rb$% => proc { |filename, _|
        filename
      },
    }
  end
  
  # Given the string filename as the path, determine
  # the corresponding tests for it, in an array.
  def tests_for_file(filename)
    super.select { |f| @files.has_key? f }
  end
end