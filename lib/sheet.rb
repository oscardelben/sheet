
# The Sheet class allows to easily dispatch commands from the command
# line. It also provides common functionality for other classes.

require 'sheet/open'
require 'sheet/write'
require 'sheet/list'
require 'sheet/copy'

class Sheet

  SHEETS_DIR = '~/.sheets/'.freeze

  class << self
    # Utility to write to standard output
    def write(message)
      puts message
    end

    # Utility to execute system commands
    def exec(cmd, replace_current_process=false)
      if replace_current_process
        Kernel.exec cmd
      else
        %x!#{cmd}!
      end
    end

    # @param [String] name the sheet name
    # @return [String]
    # Returns the path of a sheet, doesn't check if the file exists
    def sheet_path(name)
      File.join(sheets_dir, name)
    end

    # Where the sheets directory is (absolute path)
    def sheets_dir
      File.expand_path(SHEETS_DIR)
    end

    # @param [String] name the sheet name
    # @return [true]
    # Used to check if a sheet exists
    def sheet_exists?(name)
      name && File.exists?(sheet_path(name))
    end

    # @return [String]
    # Used to check the preferred editor for the user
    def editor
      exec("echo $EDITOR").chomp
    end

    # If we're using mac, we should use open to open urls.
    # If we're using linux, we can probably use xdg-open
    # Otherwise return nil
    def open_command
      if RUBY_PLATFORM =~ /darwin/
        'open'
      elsif RUBY_PLATFORM =~ /linux/ && command_available?('xdg-open')
        'xdg-open'
      else
        nil
      end
    end

    # Returns the copy to clipboard command or nil if no command is
    # found
    def copy_command
      ['pbcopy', 'xclip'].find { |cmd| command_available?(cmd) }
    end

    # Utility to check wherever a command is available in the user
    # system
    def command_available?(cmd)
      %x!type #{cmd}!.chomp.length > 0
    end

  end

  # Creates a new instance of Sheet, usually followed by a call to {#process}
  # @param [Array] args command line options
  def initialize(*args)
    @args = args.flatten
  end

  # Where the dispatching really happens. We check to see what the user
  # intended to do and then instantiate the proper class
  # TODO: refactor in a switch statement
  def process
    if ['new', 'edit'].include?(@args[0])
      write(@args[1])
    elsif ['ls', 'list'].include?(@args[0]) || @args.empty?
      list
    elsif ['cp', 'copy'].include?(@args[0])
      copy(@args[1])
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

  def copy(name)
    Sheet::Copy.new(name).copy
  end
end
