
# The purpose of the Sheet class is to dispatch to the various
# subclasses and to write to standard output.
#
# In the future we may add support for custom config files but for now
# I'd like to keep things simple.


require 'sheet/open'

class Sheet

  SHEETS_DIR = '~/.sheets/'.freeze

  class << self
    # Utility to write to standard output
    def write(message)
      puts message
    end

    # Utility to execute system commands
    def exec(cmd)
      %x!#{cmd}!
    end
  end

  # Creates a new instance of Sheet, usually followed by a call to {#process}
  # @param [Array] args command line options
  def initialize(*args)
    @args = args
  end

  # Where the dispatching really happens. We check to see what the user
  # intended to do and then instantiate the proper class
  def process
    open
  end

  private

  def open
    Sheet::Open.new(@args.first).open
  end
end
