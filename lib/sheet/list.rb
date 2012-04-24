
class Sheet
  class List

    def list
      Sheet.exec("ls -1 #{Sheet.sheets_dir}", true)
    end
  end
end
