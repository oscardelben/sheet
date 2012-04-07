
# The Sheet class allows to easily dispatch commands from the command
# line. It also provides common functionality for other classes.

require 'sheet/open'
require 'sheet/write'
require 'sheet/list'

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

    def editor
      exec("echo $EDITOR").chomp
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
    if ['new', 'edit'].include?(@args[0])
      write(@args[1])
    elsif ['ls', 'list'].include?(@args[0])
      list
    else
      open(@args[0])
    end
  end

  private

  def open(name)
    Sheet::Open.new(name).open
  end

  def write(name)
    Sheet::Write.new(name).write
  end

  def list
    Sheet::List.new.list
  end
end
