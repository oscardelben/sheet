
class Sheet
  class List

    def list
      if Sheet.sheets_directory_exists?
        Sheet.exec("ls -1 #{Sheet.sheets_dir}", true)
      else
        Sheet.write("No sheet found. Create a new sheet with `sheet new <name>`")
      end
    end
  end
end
