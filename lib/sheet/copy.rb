class Sheet
  class Copy
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def copy
      if name
        check_if_sheet_exists_and_copy_sheet
      else
        Sheet.display("Please specify a sheet name!")
      end
    end

    private
    def check_if_sheet_exists_and_copy_sheet
      if Sheet.sheet_exists?(name)
        copy_sheet
      else
        Sheet.display("A sheet named #{name} could not be found")
      end
    end

    def copy_sheet
      copy_cmd = Sheet.copy_command
      if copy_cmd
        Sheet.exec("cat #{Sheet::sheet_path(name)} | #{copy_cmd}", true)
      else
        Sheet.display("Could not copy sheet, no copy command found")
      end
    end

  end
end
