
# The Sheet class allows to easily dispatch commands from the command
# line. It also provides common functionality for other classes.

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

    # @param [String] name the sheet name
    # @return [String]
    # Returns the path of a sheet, doesn't check if the file exists
    def sheet_path(name)
      File.join(SHEETS_DIR, name)
    end

    # @param [String] name the sheet name
    # @return [true]
    # Used to check if a sheet exists
    def sheet_exists?(name)
      name && File.exists?(sheet_path(name))
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
